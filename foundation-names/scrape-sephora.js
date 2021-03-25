const {chromium} = require('playwright');
const fs = require('fs')

const results = []

async function getColorSwatches(url, page){
	await page.goto(url)

	const brand = await page.$eval('h1 a span', title => title.innerText).catch()
	const product = await page.$eval('.css-1wd4e6l', (container) => container.querySelectorAll('span')[1].innerText)

	const swatches = await page.$$eval('.css-1j1jwa4, .css-cl742e', (swatch) => swatch.map(card => {
		const description = card.getAttribute('aria-label')
		const img = card.querySelector('img');
		const imgSrc = img.getAttribute('src');
		const imgAlt = img.getAttribute('alt')
			
		return {description, imgSrc, imgAlt}
	}));

	const full = {brand, product, url, swatches}

	results.push(full)
}


async function loopThroughURLs(urls, page) {
	for (const item of urls) {
	  await getColorSwatches(item, page).catch(error => console.error(error))
	  await page.waitForTimeout(1000)
	}

	const resultsJSON = JSON.stringify(results)

	fs.writeFile('sephora.json', resultsJSON, (err, data) => {
		if (err) {
		  return console.log(err);
		}

		return data
	  });
}

async function findProductURL() {
	const browser = await chromium.launch({headless: true});
	const page = await browser.newPage();
	await page.goto('https://www.sephora.com/shop/foundation-makeup?pageSize=300')
    
	// Get scroll width and height of the rendered page and set viewport
	const bodyWidth = await page.evaluate(() => document.body.scrollWidth);
	const bodyHeight = await page.evaluate(() => document.body.scrollHeight);
	await page.setViewportSize({ width: bodyWidth, height: bodyHeight });

	await page.waitForFunction(() => {
		const items = document.querySelectorAll('.css-dkxsdo');
		items.forEach(item => item.setAttribute('data-lload', 'false'))
		return items.length > 10;
	});
     
	// find urls of each product
	const container = await page.$$eval('.css-ix8km1', items => items.map(item => item.href))
	
	await loopThroughURLs(container, page).catch(error => console.error(error))
	await browser.close()
};

findProductURL()

