out := _out

$(out)/msbob.dat: $(out)/msbob; strfile $<

$(out)/msbob: UTOPIA.sqlite3
	$(mkdir)
	sqlite3 $< 'select topText from FOTDENVIRON0 UNION select topText from FOTDWORD0' | awk '{print $0 | "fmt"; close("fmt"); printf "%32s\n%%\n", "-- Microsoft Bob"}' > $@

mkdir = @mkdir -p $(dir $@)
.DELETE_ON_ERROR:
