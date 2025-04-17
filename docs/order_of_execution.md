# Order of Execution


- Read naming conventions for any new files.
- Installation & Setup
	- Execute `install-snowsql.sh` & supply details to the prompts.
  - Execute `configure-snowsql.sh` & supply details to the prompts.
	- Check `~/.snowsql/config` file to see if the new connection is added to it.
	- Execute `connect-to-snowflake.sh`.
	- Test using the below commands.
```bash
		snowsql -c <connection_name> -f <path_to_file>/get_current_session_details.sql
```
- Execute sql files from CLI
	- Run `execute-sql-files.sh` file & test using the below command
```bash
		bash execute_sql_files.sh <connection_name> "<path_to_file>" "<file_name>.sql"
```


