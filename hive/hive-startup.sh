
#!/bin/bash

CHK=/metastore.chk
if [ ! -f "$CHK" ]; then
	$HIVE_HOME/bin/schematool -initSchema -dbType mysql
	touch $CHK    
fi

$HIVE_HOME/bin/hive --service metastore