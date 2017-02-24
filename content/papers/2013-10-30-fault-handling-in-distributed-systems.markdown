---
#layout: page
title: "Fault Handling in Distributed Systems"
# date: 2013-10-05 21:54
# comments: true
# sharing: true
# footer: true
---
<!-- # Fault Handling in Distributed Systems -->

Over time as the complexity of problems being solved by computers systems has increased, so has the complexity of the systems performing the work.  Solution platforms have migrated away from monolithic, centralized systems to highly distributed systems.  A distributed system is a collection of independent systems working in tandem to form a larger system.  Each subsystem typically utilizes an independent processor and memory space and some form of communication channel to send and receive information between subsystems.  This distributed system model allows each specialized subsystem within the solution to be controlled and managed individually to successfully fulfill the requirements of the system as a whole (Silberschatz, Galvin, Gagne, 2012, p. 673).

One of the primary benefits of a distributed system over a centralized system is that it allows the ability to effectively scale individual components to meet performance and reliability requirements.  This ability to implement redundant components is a crucial difference between distributed and centralized systems, as it allows a single subsystem within a distributed system to fail without affecting the reliability of the system as a whole.  This ability to successfully handle and recover from system failures is termed fault tolerance and is key in providing an acceptable level of system reliability.

To successfully create and sustain a reliable system, it is important to identify and understand the possible system failure points.  The failure points can be categorized into one of five possible failure types using a model published by Cristian (1991).  The five failure category types are: Crash/Fail-Stop, Omission, Timing, Response, and Arbitrary/Byzantine.  System failures can also be identified as either affecting a system’s ability to process work or its ability to communicate information between processes (Tanenbaum, A, Van Steen, M., 2002).

A crash or fail-stop system failure occurs when a component of the system fails in a way that stops its ability to process work indefinitely, until the component is either replaced or reset outside of the control of the system.   Crash type failures can be cause by both hardware and software issues and affect a system’s ability to process work.  Some common examples of hardware component failures include the loss of power to a single component, the mechanical lockup of a spinning disk drive, or internal CPU or memory faults caused by physical component overheating.   Then in software, two common issues that cause crash type failures are operating system lockups or issues within a component’s internal firmware software.  In both cases the operating system and component must to reset to successfully continue normal operations.   Similar to crash type failures, a fail-stop failure halts the continue execution of work until the failed component is reset.  The difference is that fail-stop failures are triggered by conditional flags controlled by the component (Powell, 2006, p. 44).

To detect and handle crash type failures, a system can rely on monitoring to detent when a component enters an unresponsive state.  This monitoring can be accomplished by either an active or a passive state check.  The active check consists of sending a ping type requests to the monitored component to ensure that it is capable of sending a response. The passive check relies on component sending a heartbeat communication to the monitor.  Once identified, a crash failure can be handled through the implementation of component level redundancy.   By implementation two or more instances of a component, the system is able to continue processing work on the components not impacted by the failure (Psaier, Schahram. 2010, p. 50-52).

Omission failures occur when the normal communication of information between components is disrupted.  This disruption affects the system’s ability to either send or receive information across its normal channels, impacting the system’s ability to process work successfully.  Send type omission failures occur when the system finishes the processing of a unit of work, but fails to send the complete unit to the next component.  Send failures are typically cause by software issues.  Receive type omission failures occur when the communication between components is interrupted.  This interruption could be the result of packet loss or information corruption during transit.

To detect omission type failures a system can use a combination of timing and data integrity checks around the transmission of information across communication channels.  Timeout checks allow the system to wait for a response for a set period before triggering a fault. Checksum values can be used to validate that information has not been corrupted during transport.  Once an omission failure is identified, the system can handle it by resending the failed communication again across the same or a secondary communication channel (Kumar, Yadav, Jain, 2011, p. 3).

Timing failures occur when information between components is sent and received outside of normal operating boundaries.  This deviation can have an adverse effect on a system’s ability to successfully process and communicate information.  When information is sent to quickly, sequencing and queuing issues can occur resulting to corrupt or missing data.  When information is sent to slowly, performance issues can occur that negatively impacting the entire system.

Response failures occur when a component successfully receives passed information, but the information is of an unknown or incorrect value causing the system to enter an incorrect state.  In this error state, any further processing of work has the potential of producing corrupt or unintended results.

Arbitrary or byzantine failures occur when one or more components within the system send incorrect or corrupt information to other components.  This condition can occur when components process unexpected information or are compromised by an external party.

For a system to successfully handle the different types of faults, it must be able to detect when a failure condition occurs.  Different mechanisms can be implemented to help identify potential failures, ranging from component specific monitoring to communication channel timeouts and checksums.  Centralized systems must handle failures within the constraints of their component model.  Where as distributed systems, must be capable of handling the same failures that centralized systems encounter, in addition to the issues that arise having to handle the complexities of subsystem communications and process parallelization (Cristian, 1991, p. 57).

In conclusion, both centralized and distributed systems face the same types of potential system failures.  The difference is that a distributed system can leverage its componentized nature to successfully handle and recover from failures that would normally halt a centralized system.  By implementing redundant components and data replication, a distributed system increases its capability of successfully handling many different forms of crash and omission type failures.

 
## References
* Cristian, F. (1991).  Understanding Fault-Tolerant Distributed Systems.  Retrieved from http://dl.acm.org.ezproxy.apollolibrary.com/citation.cfm?id=102801

* Kumar, A., Yadav, R., & Jain, A. (2011). Fault Tolerance in Real Time Distributed System. International Journal On Computer Science & Engineering, 3(2), 933-939.  Retrieved from http://web.ebscohost.com.ezproxy.apollolibrary.com/ehost/detail?sid=1e479aa8-7eb2-46d4-b4af-9bfc5a0be6d7

* Powell, D. (2006).  Distributed Fault Tolerance: Lessons from Delta-4.  Retrieved from http://www.computer.org.ezproxy.apollolibrary.com/csdl/mags/mi/1994/01/m1036.pdf

* Psaier, H., Schahram, D. (2010).  A survey on self-healing systems: approaches and systems.  Retrieved from http://search.proquest.com.ezproxy.apollolibrary.com/docview/840167657

* Silberschatz, A., Galvin, P., Gagne, G. (2012).  Operating System Concepts, Eighth Edition, Retrieved from University of Phoenix POS/355 course materials.

* Tanenbaum, A, Van Steen, M. (2002).  Distributed Systems Principles and Paradigms, 2nd Ed..  Retrieved from http://search.proquest.com.ezproxy.apollolibrary.com/docview/200088538
