---
# layout: page
title: "Memory Management Techniques"
# date: 2013-10-05 21:54
# comments: true
# sharing: true
# footer: true
---

<!-- ## Memory Management Techniques -->

Modern operating systems manage and control how applications access a system’s physical memory.  This control is accomplished by the operating system implementing an abstract access layer, referred to as virtual memory, between an application and the system’s physical memory.  By forcing applications to interact with this virtual memory layer, the operating system is able to provide an efficient and secure method for multiple applications to be ran concurrently.  This level of control over a system’s memory is important because physical memory is a limited resource and managing its effective utilization directly relates to the overall performance and stability of a system.  Two modern operating systems Microsoft Window and Linux have both developed their own methods for managing the balance between a system’s limited physical memory and the dynamic memory requirements of applications.  Each operating system has taken a different implementation approach; however they do share many of the same high-level concepts for effective memory management.

The Microsoft Windows operating system controls direct memory access via the implementation of its internal memory manager.  The memory manager is responsible for providing each application process and associated threads with their own virtual address space.  This assigned space is private and only accessible by the application, unless it is explicitly flagged as shared.  By limiting an application’s memory access to its own assigned virtual space, the operating system can protect against applications from accidentally or intentionally accessing and corrupting another application’s memory space (Stallings, 2012, p. 386-7).

The structure and size of Windows virtual memory space depends on the underlying architecture of the host system.   On 32-bit systems, Windows is able to assign each application a separate 32-bit or 4 Gbyte memory space.  However, the default configuration on the 32-bit system allocates a maximum of 2 Gbytes to each application as user space and the remaining 2 Gbytes is defined as system space and is shared between the operating system and applications.  This system space is used by the operating system’s kernel to manage its internal state and for temporary storage as memory caches.  Current versions of Windows can be configured to allow the default user space on 32-bit systems to be raised to 3 Gbytes via enabling the 4-gigabyte tuning (4GT) option.  This option increases user-mode space available to applications and reduces the available system space, which could affect the overall performance and stability of a system (Microsoft, 2012).  On 64-bit systems, Windows is capable of assigning each application a separate 64-bit or 8 Tbytes of user-mode addressable memory space and the default system space is set to 2 Gbytes (Stallings, 2012, p. 387).

Windows manages the virtual memory address space by dividing the memory into separate units referred to as pages.  Each page is a fixed size, ranging from 4 to 64 Kbytes depending on the underlying host system’s architecture.  When a new process is created, it is assigned the requested memory space in blocks of pages.  Overtime, as the process’s memory requirements expand and shrink so do its assigned memory pages.  The virtual memory manager tracks the availability and handling of pages by assigning them one of three states depending on their current utilization: Free, Reserved, and Committed.  Pages assigned as free are available for any process to utilize.  Where as pages assigned as reserved are flagged for future use by a process, however no physical memory storage is allocated.  The final page state is committed where the page is loaded into physical memory on the initial attempt to read or write to it (Microsoft, 2012).

In comparison to Windows, the Linux operating system handles the utilization of a system’s memory using similar high-level concepts.  Linux implements its own virtual memory manager, which acts as an abstraction layer between both the operating system’s kernel and user-mode application processes and the system’s physical memory.  Linux’s virtual memory manager also uses the concept of pages to divide the available virtual memory space into manageable units.  The primary difference between the Linux and Windows memory managers is that Linux uses a hierarchical three-level paging structure to manage the translation between an application’s virtual user memory space and the system’s physical memory.  This layered approach is able to effectively handle both 32-bit and 64-bit system architectures with no impact on run-time performance (Stallings, 2012, p. 385).  Linux also utilizes a page allocation approach that maximizes the number of continuous page blocks in groups of 1 to 32 page frames, which allows for the efficient movement of pages in and out of the system’s physical memory.  The allocation routine also utilizes a page replacement algorithm that allows frequently accessed pages to remain in the system’s physical memory, increasing the overall performance of the system (Gorman, 2007, p. 164).

In conclusion, modern operating systems have implemented memory management techniques that allow for the expansion beyond the host system’s physical memory.  With memory address virtualization, modern operating systems are able to successfully balance the memory requirements of competing and highly concurrent applications with the overall stability and performance of a system.

## References

 * William Stallings (2012).  Operating Systems: Internals and Design Principles, 7e, 384-389.  Retrieved from University of Phoenix POS/355 course materials.

 * Microsoft (2013). Memory Management.  Retrieved from http://msdn.microsoft.com/en-us/library/windows/desktop/aa366779%28v=vs.85%29.aspx.

 * Gorman, M. (2007). Understanding the Linux Virtual Memory Manager, 164. Retrieved from https://www.kernel.org/doc/gorman/pdf/understand.pdf

- - -

Published: October 6, 2013
