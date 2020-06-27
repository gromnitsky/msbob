i := $(if $(i),,$(error i= is required))

out := .
src := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
cscript := $(if $(filter x86_64,$(shell uname -m)),$(shell cygpath $(WINDIR))/SysWOW64/cscript,cscript)
strfile := /usr/sbin/strfile

$(out)/cookies/msbob.dat: $(out)/cookies/msbob

$(out)/cookies/msbob: $(out)/msbob.rows
	$(mkdir)
	cat $< | awk 'BEGIN{RS="~~~"} {print $0 | "fmt"; close("fmt"); printf "%32s\n%%\n", "-- Microsoft Bob"}' | tr -d '\015' > $@

$(out)/msbob.rows: $(out)/FOTDENVIRON0.csv $(out)/FOTDWORD0.csv
	@echo sqlite...
	@echo "$$rows" | sqlite3 > $@

$(out)/jet4.mdb: $(i)
	$(cscript) /nologo `cygpath -w $(src)/mdb-compact.js` $< $@

$(out)/%.csv: $(out)/jet4.mdb
	mdb-export $< $* > $@

export define rows =
create table FOTDENVIRON0(Date,FileID,topText,topLeft,topTop,topWidth,topHeight,bottomText,botLeft,botTop,botWidth,botHeight,Month);
create table FOTDWORD0(Date,FileID,topText,topLeft,topTop,topWidth,topHeight,bottomText,botLeft,botTop,botWidth,botHeight,Month);
.mode csv
.import FOTDENVIRON0.csv FOTDENVIRON0
.import FOTDWORD0.csv FOTDWORD0

.mode list
.separator ROW ~~~
select topText from FOTDENVIRON0 UNION select topText from FOTDWORD0;
endef

$(out)/%.dat: %; $(strfile) $<

mkdir = @mkdir -p $(dir $@)
.DELETE_ON_ERROR:
