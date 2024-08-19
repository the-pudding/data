# The story behind [insert video title]
Queues are guaranteed to form when the demand rate exceeds the supply capacity, or the number of customers who can be served per unit of time. However, even when average capacity exceeds the average demand rate, queues can still form when there’s sufficient variability in either arrival times or the time required for service.

This video highlights a few different situations where queues might arise, all in the familiar context of an airport.

See a summary of core takeaways below, and scroll further down for additional detail.

| **Scene**      | **Description** | **Setting** | **Core takeaway**     |
| :---  |    :----:   | :----:   |         :--- |
| 1      | Pooled vs Parallel        | Ticket counter        | Pooled queues (where a single line leads to multiple agents) can be much faster than parallel queues (where each line leads to one agent) because they create economies of scale and allow for flexible reallocation of capacity in response to variability (e.g., if one customer takes an unusually long time to serve). Pooling can achieve lower wait times for a given capacity level or lower capacity utilization for a given service level.   |
| 2   | Priority queues and fairness        | Café      | Moving “quick” customers to the front of the queue ahead of “slow” customers can significantly decrease average wait times, but it comes at the cost of longer waits for the “slow” customers. More generally, queue designers have to trade off different considerations, including fairness vs optimal system performance.     |
| 3   | Alternative queueing disciplines       | Concert tickets  | When a good has limited supply and service (specifically, the service of allowing customers to purchase the good) is provided on a first-come-first-serve (aka first-in-first-out, or FIFO) basis, customers can end up queuing earlier and earlier in order to secure an opportunity for service. Think pre-announced drops of the latest iPhone or shoe model, sports tickets, concert tickets, etc. This can spiral until the entire benefit gained from the good is eaten up by the cost of queuing. As such, people who value the product the most may be disadvantaged in a FIFO system with limited goods. Queue designers can use solutions such as lotteries to mitigate this issue.    |
| 4   | Boundless queues        | Immigration      | If system capacity (represented by the processing time, or service rate) exceeds the rate of new arrivals, queues may either a) never arise (if there is no variability) or b) arise temporarily due to variability in arrivals or processing, but the system will eventually be able to resolve the queues. If the service rate is slower than the arrival rate, queue length and wait time can increase indefinitely.      |


# Scene \# 1: Pooled vs. Parallel (Ticket counter)
***
<img src="figures/assumptions_box_sc1.png" width=250 height=300>

In the first scene, we explore the concept of pooling. Pre-assigning customers to a server can lead to a situation where passengers in one queue are waiting despite some of the other servers being available. Pooling allows the system to eliminate such inefficient imbalances* by flexibly redeploying capacity.

For our first example, we assume that customers arrive every 45 seconds, and that it takes 90 seconds to serve each one We calculated how long it would take an average newly-arriving customer to get through each line using the following formulas: 

Average wait time for customers in the single server setup:

$$W_{parallel} = s \left( \frac{U^{\sqrt{2(m+1)}-1}}{1-U} \right) \left(\frac{(CV_a + CV_s)^2}{2} \right)$$

Average wait time for customers in the multiple-server setup:

$$W_{pooled} = \frac{s}{m} \left( \frac{U}{1-U} \right) \left(\frac{(CV_a + CV_s)^2}{2} \right)$$


where $$s$$ is the processing time for a single server and $$m$$ is the number of servers.

Comparing these two wait times allowed us to calculate the reduction in waiting time that was achieved through pooling.

In reality, there would be some variation in arrival and processing times

To create this simulation, we slightly perturbed the interarrival time (using a normal distribution centered at 45 seconds and with SD = 1), as well as the service time ($$\mu = 90, \sigma = 1$$). Varying arrival time and service time has the effect of also varying the utilization between 61.5\% and 73.1\%. Importantly, utilization is always below 100\%, which means that we have a stable queue. Over these 1000 reps, we then calculated the resulting waiting times for the parallel and pooled scenarios using the same formulas as above.

The result was an average pooling reduction of 76.2\%, with all 1000 reps achieving a reduction of at least 74%.


If we  increase the variability of interarrival times to more accurately represent periods of the day/week that are slightly more or less busy (e.g., SD of 4 seconds for interarrival times), the time between passenger arrivals ranges between 34 seconds and 58 second across the 1000 reps). With service times still distributed tightly around 90 seconds, this causes server utilization to vary between 52 and 88\%). Even with this greater variability, we would still get a reduction of 70\% or more for all reps.

In general, wait time depends on system capacity, server utilization, and variability** in arrival or processing times. It's worth noting that wait times - and also, the difference in wait times between a parallel and pooled setup - are [sensitive](https://nickarnosti.com/blog/longwaits/#fn6) to server utilization level (i.e., how busy a server is), which is why planners often opt to have slack in server availability. The number of servers changes how high this sensitivity is [3].


*Note: this may backfire in settings such as healthcare, where the relationship between customer and server (or the server’s sense of [“customer ownership”](https://knowledge.insead.edu/operations/when-several-queues-are-better-one)) can impact processing time, or in settings where customers are [delay-sensitive](https://pubsonline.informs.org/doi/10.1287/mnsc.2020.3663) and decide whether or not to join based on queue length.

**In the context of queueing, this is typically measured using what’s called the “coefficient of variation,”  or the ratio of the standard deviation to the mean for each quantity.

# Scene \# 2: Priority queues and fairness (Café)
***
<img src="figures/assumptions_box_sc2.png" width=250 height=300>

In our second example, we consider a situation where we have more than one type of customers. These are formally known as “multiclass” models, where customer groups may have different arrival rates and service rates.

In a system with multiple classes, waiting time includes the following components: 
- Remaining service time for those already in service when you arrive
- Service time for those still waiting for service when you arrive
- Service time for those who arrive after you, but who must be served first (this is zero unless you’re using a preemptive priority policy)
- Your own service time


In general, you can think of the wait time under each policy for a customer in each class as follows. Note that each term in the equations below corresponds to one of the components described above. Can you identify which is which?

<ins>__Equal Priority__</ins> \
Coffee: $$W_c = Q_c S_c + Q_s s_s + s_c$$ \
Sandwich: $$W_s = Q_s S_s + Q_c s_c + s_s$$ 

<ins>__Non-preemptive priority for coffee-drinkers__</ins> \
Coffee: $$W_c = Q_c S_c + U_s s_s s_c$$ \
Sandwich: $$W_s = Q_s S_s + Q_c s_c + \lambda_c W_s s_c + s_s$$

<ins>__Preemptive priority for coffee-drinkers__</ins> \
Coffee: $$W_c = Q_c S_c + s_c$$ \
Sandwich:  $$W_s = Q_s S_s + Q_c s_c + \lambda_c (W_s - s_s) s_c + s_s$$

where:

$$𝑄_𝐶:$$ avg \# coffee customers in queue

$$𝑠_𝑐:$$ service time for coffee customers

$$𝑄_𝑠:$$ avg \# sandwich customers in queue

$$𝑠_𝑠:$$ service time for sandwich customers

To study this empirically, we generated a sequence of coffee and sandwich customers arriving according to the parameters stated above, and then calculated the exact wait time (from arrival to service completion) for each class under each policy.

The figure below demonstrates the distribution of wait times under each policy. As you may have expected, non-preemptive priority provides a compromise between a fully preemptive policy and treating all customers equally (though sandwich customers may not see it that way!).

<p align="center">
<img src="figures/policy_comparison_plot_sc2.png" alt="Wait time distribution under three different priority policies" width=600 height=400> </p>

We mention in the video the idea of providing "some, but not infinite" priority: To implement this, the shop owners might decide to optimize for minimizing the average wait time while ensuring that the maximum wait time does not exceed a certain limit. The outcome of this might be that if there are coffee-orderers waiting, they can take a break from making sandwiches, but only up to a maximum number of coffee orders.


If the average wait time for sandwich orders increases enough, the sandwich-orderer might get tired or reach the point where they’d have to leave to catch their flight, and therefore abandon the queue. Finding compromise solutions is therefore important.

# Scene \# 3: Alternative queueing disciplines (Beyoncé tickets)
***
In this scenario, you're queueing for a scarce good (concert tickets). There are many ways to allocate scarce goods: ticket prices often vary widely even within a single section, and are used to differentially target customers with different willingness to pay. That said, even for tickets at the same price, there is limited supply, and not everyone who wants one will get one - especially for sought-after artists. In other words, service is not guaranteed even if you complete the wait.

You place a certain amount of value on seeing Beyonce (e.g., $1000). In this case, each person’s value is private (and perhaps not even consciously known to the individuals themselves). In other cases, value is known to each individual, and can be elicited using auctions or similar methods. Also, because there is a chance of not securing the ticket, some people may calculate an “expected value” which incorporates their beliefs about the likelihood of securing a ticket.

You also incur a certain cost while waiting. Most people aren’t explicitly tallying these costs, but you can imagine that each person has a subconscious “willingness to wait”, perhaps captured by the length of time beyond which even the guarantee of a ticket would no longer be worth enduring the wait. This is connected to the fact that each person has an opportunity cost of waiting (perhaps the amount they might be earning at work if they hadn’t taken time off to wait). If we could determine this figure for each person, we could find the point at which we’d expect them to abandon the queue. 

A common default queue policy is typically first in, first out (FIFO) – but this can cause issues for highly competitive goods. Because of a mismatch between cost of waiting and value of the good, FIFO may fail to allocate the good to those who value it most, and may instead advantage those with a lower cost of waiting.

FIFO policies have other issues: they may also incentivize scalpers to hoard tickets and sell them at a premium. Allowing fans to pay for priority access to the queue is one option that has been used in many settings, but imposing additional financial burden for a good that is already so costly may be undesirable. Other alternatives, such as releasing tickets in stages, offering scheduled viewing or buying windows, or even unusual policies such as [serving the last person to arrive first](https://www.sciencenordic.com/culture-denmark-environment/queues-move-faster-if-the-last-person-is-served-first/1420582), may incentivize users to change their behavior in a way that reduces average waiting time. Queue designers have a lot to consider when allocating complex resources like this.


# Scene \# 4: Boundless queues (Immigration)
***
<img src="figures/assumptions_box_sc4.png" width=400 height=230>

In the final scene, we explore the idea that a queue can, for all practical purposes, become infinitely long under the right (well, wrong) circumstances.

Two queue properties are relevant here: the service rate refers to how quickly each person gets through the line (in other words, it's connected to the system’s capacity), and the arrival rate is how quickly new people are arriving - this represents demand.

Queues at the airport fluctuate in length over the course of the day, and disappear completely when the balance between capacity and demand rate becomes more favorable-for example, due to a slowdown in flight arrivals or the addition of more immigration officers. Airports can take proactive measures to prevent these queues from getting too long by controlling arrival rate, service rate, or both. For example, an airport may limit the number of international flights that can arrive in a given hour, and tools such as pre-approval programs like Global entry can help reduce the time required to serve some customers.

Just as service capacity can be increased through staffing levels, it can be decreased for some or all customers. For example, when some staff are dedicated to serving customers from a different group, those groups are facing different service rates, as in the case of priority queues or quotas. At the airport, this could be queues for foreign versus domestic passengers. In the immigration context shared in the video, these quotas are nationality - based.

Once the wait time becomes effectively infinite, customers have no choice but to opt out of service. A consistent inability of a system to process customers faster than they arrive is therefore a more serious problem.

## References
***
[1] Richard Larson and Amedeo Odoni. 1981. Urban Operations Research. Prentice-Hall.

[2] Gerard Cachon and Christian Terwiesch. 2018. Matching Supply with Demand: An Introduction to Operations Management (4th ed.). McGraw-Hill.

[3] Gerard Cachon and Christian Terwiesch. 2022. Operations Management (3rd ed.). McGraw-Hill.

[4] Lecture notes and course materials on queueing theory and simulation/stochastic modeling by Daniel S. Myers

### Acknowledgements
**
Many thanks to Professor Daniel S. Myers, Dr. Shraddha Rana, Dr. Angela Acocella, and Professor Abhishek Deshmane for their feedback and suggestions during the development of this story.