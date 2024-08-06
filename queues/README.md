# The story behind XXX
Queues are guaranteed to form when the demand rate exceeds the supply capacity, or the number of customers who can be served per unit of time. However, even when average capacity exceeds the average demand rate, queues can still form when there’s sufficient variability in either arrival times or the time required for service.


# Scene \# 1: Pooled vs. Parallel (Ticket counter)
***
[add assumptions box]

<img src="figures/assumptions_box_sc1.png" width=250 height=300>

**Core Takeaway:** Pooled queues (where a single line leads to multiple agents) can be much faster than parallel queues (where each line leads to one agent) because they create economies of scale and allow for flexible reallocation of capacity in response to variability (e.g., if one customer takes an unusually long time to serve). Pooling can achieve lower wait times for a given capacity level or lower capacity utilization for a given service level.

# Scene \# 2: Priority queues and fairness (Café)
***
[add assumptions box]

In a system with multiple classes, waiting time includes the following components: 
- Remaining service time for those already in service when you arrive
- Service time for those still waiting for service when you arrive
- Service time for those who arrive after you, but who must be served first (this is zero unless you’re using a preemptive priority policy)
- Your own service time


**Core Takeaway:** Moving “quick” customers to the front of the queue ahead of “slow” customers can significantly decrease average wait times, but it comes at the cost of longer waits for the “slow” customers. More generally, queue designers have to trade off different considerations, including fairness vs optimal system performance.

# Scene \# 3: Alternative queueing disciplines (Beyoncé tickets)
***
[add assumptions box]

**Core Takeaway:** When a good has limited supply and service (specifically, the service of allowing customers to purchase the good) is provided on a first-come-first-serve (aka first-in-first-out, or FIFO) basis, customers can end up queuing earlier and earlier in order to secure an opportunity for service. Think pre-announced drops of the latest iPhone or shoe model, sports tickets, concert tickets, etc. This can spiral until the entire benefit gained from the good is eaten up by the cost of queuing. As such, people who value the product the most may be disadvantaged in a FIFO system with limited goods. Queue designers can use solutions such as lotteries to mitigate this issue.

# Scene \# 4: Boundless queues (Immigration)
***
[add assumptions box]

**Core Takeaway:** If system capacity (represented by the processing time, or service rate) exceeds the rate of new arrivals, queues may either a) never arise (if there is no variability) or b) arise temporarily due to variability in arrivals or processing, but the system will eventually be able to resolve the queues. If the service rate is slower than the arrival rate, queue length and wait time can increase indefinitely.



## References
***
Richard Larson and Amedeo Odoni. 1981. Urban Operations Research. Prentice-Hall.

Gerard Cachon and Christian Terwiesch. 2018. Matching Supply with Demand: An Introduction to Operations Management (4th ed.). McGraw-Hill.

Gerard Cachon and Christian Terwiesch. 2022. Operations Management (3rd ed.). McGraw-Hill.

Lecture notes and course materials on queueing theory and simulation/stochastic modeling by Daniel S. Myers

### Acknowledgements
**
Many thanks to Professor Daniel S. Myers, Shraddha Rana, Dr. Angela Acocella, Professor Abhishek Deshmane for their feedback and suggestions during the development of this story.