---
# layout: page
title: "UNIX File Security Controls"
# date: 2013-10-05 21:54
# comments: true
# sharing: true
# footer: true
---

<!-- # UNIX File Security Controls -->

UNIX operating systems directly manage file system level security by implementing what is referred to as traditional UNIX file access controls or by implementing access control lists.  Both security models are capable of managing and controlling user access to the operating system’s underlying file systems.  When presented with the operational scenario of limiting the access of a single file to a subset of 4,990 users out of a system’s total user base of 5,000, both of the UNIX file access control models could be implemented to successfully control the file’s access with varying benefits and complexities.

The traditional UNIX file access control model relies on a set of inode level attributes to manage file permissions.  When a file is created, its assigned security attributes consist of an owner ID, group ID, and a set of 12 protection bits.  The owner ID and group ID values are set to reflect the values of the user creating the file.  The 12 protection bits can be broken down into two separate groupings.  The first grouping is a collection of three separate triplet values, which control the read, write, and execute permission of a file to different classes of users.  The three class types are the owner, group, and other.  The owner class bits set the permission rights the user matching the files owner ID would be granted.  The group class bits set the permission rights of any user that is a member of the file’s assigned group ID value.  The final class type of other defines the permission rights of any user that is not a member of the file’s assign group ID (FreeBSD, 2013).   The second grouping of protection bits consists of three bits that are used to define special behaviors to the associated file or directory.  The first two bits in this group are used to define a file’s SetUID and SetGID values.  These values are used be the system to execute the file as the assigned effective user ID or group ID instead of the invoking user’s real user ID or group ID.  This allows the executed file temporary access privileges beyond that of the executing user.  When the SetGID value is set on a directory any new file created within it will inherit it as its default group ID.  The last permission bit in this group is referred to as the “Sticky” bit and when set on a directory it limits the ability to rename, move or delete any file within the directory to the file’s owner (Shields, 2010).

One approach of implementing the initial file access scenario using the traditional UNIX file access controls would be to grant permission to the file to a newly created system group.  This would be accomplished by creating the system group and adding each of the 4,990 users to it.  Then by changing the file’s assigned group ID value to the newly created group ID and setting the group class permission bits to allow read, write, and execute access.  This approach would allow the 4,990 members of the newly created group full access to the file, while the remaining 10 users, who are not members of the group, would not have access.

The other method of controlling file access on a UNIX system is with access control lists.  Access control lists extend the functionality of the traditional access control model, but allow for an expended list of allowed users and groups beyond the traditional model’s three class approach of owner, group, and other.  A separate access control list can be assigned to each file or directory.  Each access control list can contain on unlimited number of users or groups each with their own set of permission bits granting separate read, write, and execute access.  These permission bits are then masked against the file’s traditional group class permission bit to determine the final access rights of the user (Grünbacher, 2003).

One approach to implement the initial file access scenario using access control lists would be to grant permission to each of the 4,990 users via their unique user IDs as separate access control list entries on the selected file.  Another approach would be to grant access to list of groups IDs that the 4,990 users are members of to the access control list.  The access control list approach allows the flexibility to grant file permissions to a large number of different users and groups to files without the need of creating and maintaining new system level groups.

In conclusion, UNIX is capable of handling both directory and file level access controls for systems with both small and large user bases.  The two primary approaches to UNIX file system security are traditional file access controls and access control lists.  Both approaches provide the ability to manage file access permissions at both the user and group levels.  By leveraging both approaches, UNIX is capable of providing the necessary flexibility to successfully manage the file system security requirements for a variety of different file access and usage scenarios.


## References

* Stallings, W. (2012).  Operating Systems: Internals and Design Principles, 7e, 558-560.  Retrieved from University of Phoenix POS/355 course materials.

* Grünbacher, A. (2003).  POSIX Access Control Lists on Linux.  Retrieved from http://users.suse.com/~agruen/acl/linux-acls/online/

* Shields, I (2010).  Learn Linux, 101: Manage file permissions and ownership.  Retrieved from http://www.ibm.com/developerworks/library/l-lpic1-v3-104-5/

* FreeBSD (2013).  FreeBSD Handbook, Permissions.  Retrieved from http://www.freebsd.org/doc/handbook/permissions.html

- - -

Published: October 13, 2013
