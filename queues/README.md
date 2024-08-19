# The story behind [insert video title]
Queues are guaranteed to form when the demand rate exceeds the supply capacity, or the number of customers who can be served per unit of time. However, even when average capacity exceeds the average demand rate, queues can still form when there’s sufficient variability in either arrival times or the time required for service.

This video highlights a few different situations where queues might arise, all in the familiar context of an airport.

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

To create this simulation, we perturbed the interarrival time slightly (using a normal distribution centered at 45 seconds and with SD = 1, Varying arrival time and utilization has the effect of also varying the service time. Over these 1000 reps, we then calculated the resulting waiting times for the parallel and pooled scenarios using the same formulas as above.

The result was XXX.


If we were to increase the variability of interarrival times to more accurately represent periods of the day/week that are slightly more or less busy (e.g., SD of X for interarrival times and Y for service times) and server utilization (using a uniform distribution, ranging between 60 and 85%). we would still get a reduction or more for XYZ.

[include a note on how we got utilization]

In general, wait time depends on system capacity, server utilization, and variability** in arrival or processing times. It's worth noting that wait times - and also, the difference in wait times between a parallel and pooled setup - are [sensitive](https://nickarnosti.com/blog/longwaits/#fn6) to server utilization level (i.e., how busy a server is), which is why planners often opt to have slack in server availability. The number of servers changes how high this sensitivity is [3].

**Core Takeaway:** Pooled queues (where a single line leads to multiple agents) can be much faster than parallel queues (where each line leads to one agent) because they create economies of scale and allow for flexible reallocation of capacity in response to variability (e.g., if one customer takes an unusually long time to serve). Pooling can achieve lower wait times for a given capacity level or lower capacity utilization for a given service level.

*Note: this may backfire in settings such as healthcare, where the relationship between customer and server (or the server’s sense of [“customer ownership”](https://knowledge.insead.edu/operations/when-several-queues-are-better-one)) can impact processing time, or in settings where customers are [delay-sensitive](https://pubsonline.informs.org/doi/10.1287/mnsc.2020.3663) and decide whether or not to join based on queue length.

**In the context of queueing, this is typically measured using what’s called the “coefficient of variation,”  or the ratio of the standard deviation to the mean for each quantity.

# Scene \# 2: Priority queues and fairness (Café)
***
<img src="figures/assumptions_box_sc2.png" width=250 height=300>

In our second example, we consider a situation where we have more than one type of customers. These are formally known as “multiclass” models, where customer groups may have different arrival rates and service rates

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

where
$$𝑄_𝐶:$$ avg \# coffee customers in queue
$$𝑠_𝑐:$$ service time for coffee customers
$$𝑄_𝑠:$$ avg \# sandwich customers in queue
$$𝑠_𝑠:$$ service time for sandwich customers

To study this empirically, we generated a sequence of coffee and sandwich customers arriving according to the parameters stated above, and then calculated the exact wait time (from arrival to service completion) for each class under each policy.

The figure below demonstrates the distribution of wait times under each policy. As you may have expected, non-preemptive priority provides a compromise between a fully preemptive policy and treating all customers equally (though sandwich customers may not see it that way!).

<p align="center">
<img src="figures/policy_comparison_plot_sc2.png" alt="Wait time distribution under three different priority policies" width=250 height=300> </p>

**Core Takeaway:** Moving “quick” customers to the front of the queue ahead of “slow” customers can significantly decrease average wait times, but it comes at the cost of longer waits for the “slow” customers. More generally, queue designers have to trade off different considerations, including fairness vs optimal system performance.

# Scene \# 3: Alternative queueing disciplines (Beyoncé tickets)
***

In this scenario, you're queueing for a scarce good (concert tickets), so service is not guaranteed even if you complete the wait. The default queue policy is typically first in, first out (FIFO) – this can cause issues for highly competitive/desirable/scarce goods. Because there is a mismatch between cost of waiting and value of the good, FIFO may fail to allocate the good to those who value it most. 
 
Your private value of seeing Beyonce is, e.g., $1000. As the wait time required to get a ticket increases, you are priced out of the ability to wait for a ticket. 

**Core Takeaway:** When a good has limited supply and service (specifically, the service of allowing customers to purchase the good) is provided on a first-come-first-serve (aka first-in-first-out, or FIFO) basis, customers can end up queuing earlier and earlier in order to secure an opportunity for service. Think pre-announced drops of the latest iPhone or shoe model, sports tickets, concert tickets, etc. This can spiral until the entire benefit gained from the good is eaten up by the cost of queuing. As such, people who value the product the most may be disadvantaged in a FIFO system with limited goods. Queue designers can use solutions such as lotteries to mitigate this issue.

# Scene \# 4: Boundless queues (Immigration)
***
<img src="figures/assumptions_box_sc4.png" width=250 height=300>

In the final scene, we explore the idea that a queue can, for all practical purposes, become infinitely long under the right (well, wrong) circumstances.

Two queue properties are relevant here: The service rate refers to how quickly each person gets through the line (in other words, the system’s capacity), and the arrival rate is how quickly new people are arriving - this represents demand.

Lines at the airport fluctuate over the course of the day, and clear completely when the balance between capacity and demand rate becomes more favorable-for example, due to a slowdown in flight arrivals or the addition of more immigration officers. Airports can take proactive measures to prevent these queues from getting too long by controlling arrival rate, service rate, or both. For example, an airport may limit the number of international flights that can arrive in a given hour, and tools such as pre-approval programs like Global entry can help reduce the time required to serve some customers.

Just as service capacity can be increased through staffing levels, it can be decreased for some or all customers. For example, when some staff are dedicated to serving customers from a different group, those groups are facing different service rates, as in the case of priority queues or quotas. At the airport, this could be queues for foreign versus domestic passengers. In the immigration context shared in the video, these quotas are nationality - based.

Once the wait time becomes effectively infinite, customers have no choice but to opt out of service. A consistent inability of a system to process customers faster than they arrive is therefore a more serious problem.

**Core Takeaway:** If system capacity (represented by the processing time, or service rate) exceeds the rate of new arrivals, queues may either a) never arise (if there is no variability) or b) arise temporarily due to variability in arrivals or processing, but the system will eventually be able to resolve the queues. If the service rate is slower than the arrival rate, queue length and wait time can increase indefinitely.



## References
***
[1] Richard Larson and Amedeo Odoni. 1981. Urban Operations Research. Prentice-Hall.

[2] Gerard Cachon and Christian Terwiesch. 2018. Matching Supply with Demand: An Introduction to Operations Management (4th ed.). McGraw-Hill.

[3] Gerard Cachon and Christian Terwiesch. 2022. Operations Management (3rd ed.). McGraw-Hill.

[4] Lecture notes and course materials on queueing theory and simulation/stochastic modeling by Daniel S. Myers

### Acknowledgements
**
Many thanks to Professor Daniel S. Myers, Dr. Shraddha Rana, Dr. Angela Acocella, and Professor Abhishek Deshmane for their feedback and suggestions during the development of this story.