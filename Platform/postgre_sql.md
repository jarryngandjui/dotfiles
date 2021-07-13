# PostgreSQL - [docs](https://www.postgresql.org/docs/current/)

### [What is PostgreSQL?](https://www.postgresql.org/docs/current/app-postgres.html)

postgres is the PostgreSQL database server. In order for a client application to access a database it connects (over a `network or locally`) to a running postgres instance.

The postgres command can also be called in `single-user mode`. The primary use for this mode is during bootstrapping by initdb. Sometimes it is used for debugging or disaster recovery; note that running a single-user server is not truly suitable for debugging the server, since no realistic interprocess communication and locking will happen. When invoked in single-user mode from the shell, the user can enter queries and the results will be printed to the screen, but in a form that is more useful for developers than end users. In the single-user mode, the session user will be set to the user with ID 1, and implicit superuser powers are granted to this user. This user does not actually have to exist, so the single-user mode can be used to manually recover from certain kinds of accidental damage to the system catalogs.




### [Server Setup and Operation](https://www.postgresql.org/docs/current/runtime.html)

[The PostgreSQL User Account](https://www.postgresql.org/docs/current/postgres-user.html) As with any server daemon that is accessible to the outside world, it is advisable to run PostgreSQL under a separate user account. This user account should only own the data that is managed by the server, and should not be shared with other daemons. (For example, using the user nobody is a bad idea.) In particular, it is advisable that this user account not own the PostgreSQL executable files, to ensure that a compromised server process could not modify those executables.

[initdb](https://www.postgresql.org/docs/current/app-initdb.html) initdb creates a new PostgreSQL database cluster. A database cluster is a collection of databases that are managed by a single server instance.

Creating a database cluster consists of creating the directories in which the database data will live, generating the shared catalog tables (tables that belong to the whole cluster rather than to any particular database), and creating the template1 and postgres databases. When you later create a new database, everything in the template1 database is copied. (Therefore, anything installed in template1 is automatically copied into each database created later.) The postgres database is a default database meant for use by users, utilities and third party applications.

There is no default, although locations such as /usr/local/pgsql/data or /var/lib/pgsql/data are popular. To initialize a database cluster manually, run initdb and specify the desired file system location of the database cluster with the -D option, for example:
```
$ initdb -D /usr/local/pgsql/data
```

Although initdb will attempt to create the specified data directory, it might not have permission if the parent directory of the desired data directory is root-owned. To initialize in such a setup, create an empty data directory as root, then use chown to assign ownership of that directory to the database user account, then su to become the database user to run initdb.

initdb must be run as the user that will own the server process, because the server needs to have access to the files and directories that initdb creates. Since the server cannot be run as root, you must not run initdb as root either. (It will in fact refuse to do so.)

For security reasons the new cluster created by initdb will only be accessible by the cluster owner by default. The --allow-group-access option allows any user in the same group as the cluster owner to read files in the cluster. This is useful for performing backups as a non-privileged user.

initdb initializes the database cluster's default locale and character set encoding. The character set encoding, collation order (LC_COLLATE) and character set classes (LC_CTYPE, e.g., upper, lower, digit) can be set separately for a database when it is created. initdb determines those settings for the template1 database, which will serve as the default for all other databases. [more on initdb](https://www.postgresql.org/docs/current/app-initdb.html). 
[common server errors](https://www.postgresql.org/docs/current/server-start.html#CLIENT-CONNECTION-PROBLEMS).

[Managing Kernel Resources](https://www.postgresql.org/docs/current/kernel-resources.html) PostgreSQL requires the operating system to provide inter-process communication (IPC) features, specifically shared memory and semaphores. Unix-derived systems typically provide “System V” IPC, “POSIX” IPC, or both. By default, PostgreSQL allocates a very small amount of System V shared memory, as well as a much larger amount of anonymous mmap (virtual memory) shared memory. [System V IPC Parameters](https://www.postgresql.org/docs/current/kernel-resources.html)

[Shutting Down the Server](https://www.postgresql.org/docs/current/server-shutdown.html) 

**SIGTERM**
This is the Smart Shutdown mode. After receiving SIGTERM, the server disallows new connections, but lets existing sessions end their work normally. It shuts down only after all of the sessions terminate. If the server is in online backup mode, it additionally waits until online backup mode is no longer active. While backup mode is active, new connections will still be allowed, but only to superusers (this exception allows a superuser to connect to terminate online backup mode). If the server is in recovery when a smart shutdown is requested, recovery and streaming replication will be stopped only after all regular sessions have terminated.

**SIGINT**
This is the Fast Shutdown mode. The server disallows new connections and sends all existing server processes SIGTERM, which will cause them to abort their current transactions and exit promptly. It then waits for all server processes to exit and finally shuts down. If the server is in online backup mode, backup mode will be terminated, rendering the backup useless.

**SIGQUIT**
This is the Immediate Shutdown mode. The server will send SIGQUIT to all child processes and wait for them to terminate. If any do not terminate within 5 seconds, they will be sent SIGKILL. The master server process exits as soon as all child processes have exited, without doing normal database shutdown processing. This will lead to recovery (by replaying the WAL log) upon next start-up. This is recommended only in emergencies. `It is best not to use SIGKILL to shut down the server. Doing so will prevent the server from releasing shared memory and semaphores. Furthermore, SIGKILL kills the postgres process without letting it relay the signal to its subprocesses, so it might be necessary to kill the individual subprocesses by hand as well.`