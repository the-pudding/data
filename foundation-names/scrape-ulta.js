const {chromium} = require('playwright');
const fs = require('fs')

const results = []

async function getColorSwatches(url, page){
	await page.goto(url).catch(error => console.error(error))

	const brand = await page.$eval('.ProductMainSection__brandName', title => title.innerText).catch(error => console.error(error))
	const product = await page.$eval('.ProductMainSection__productName', (container) => container.querySelector('span').innerText)
	const item = await page.$eval('.ProductMainSection__itemNumber', number => number.innerText)

	const swatches = await page.$$eval('.ProductSwatchImage__image img', (swatch) => swatch.map(card => {

		const imgSrc = card.getAttribute('src');
		const imgAlt = card.getAttribute('alt');
		const description = imgAlt
			
		return {description, imgSrc, imgAlt}
	}));

	const full = {brand, product, url, swatches}
	const fullJSON = JSON.stringify(full)

	fs.writeFile(`ulta/${item}.json`, fullJSON, (err, data) => {
		if (err) {
		  return console.log(err);
		}

		return data
	  });


	results.push(full)
}


async function loopThroughURLs(urls, page) {
	for (const item of urls) {
	  await getColorSwatches(item, page).catch(error => console.error(error))
	  await page.waitForTimeout(2000)
	}

	const resultsJSON = JSON.stringify(results)

	fs.writeFile('ulta.json', resultsJSON, (err, data) => {
		if (err) {
		  return console.log(err);
		}

		return data
	  });
}

async function findProductURL() {
	const browser = await chromium.launch({headless: true, args: ['--disable-features=site-per-process']});
	const page = await browser.newPage();
	await page.goto('https://www.ulta.com/makeup-face-foundation?N=26y5&No=0&Nrpp=200')
    
	// Get scroll width and height of the rendered page and set viewport
	const bodyWidth = await page.evaluate(() => document.body.scrollWidth);
	const bodyHeight = await page.evaluate(() => document.body.scrollHeight);
	await page.setViewportSize({ width: bodyWidth, height: bodyHeight });
    
     
	// find urls of each product
	const container = await page.$$eval('.product', items => items.map(item => item.href))
    
	const sub = container.slice(189, container.length)
	
	await loopThroughURLs(sub, page).catch(error => console.error(error))
	await browser.close()
};

findProductURL()