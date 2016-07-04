erlsrcdir = $(ERLANG_INSTALL_LIB_DIR_yamerl_the_fork)/src

dist_erlsrc_DATA = yamerl_the_fork_app.erl					\
		   yamerl_the_fork_sup.erl					\
		   yamerl_the_fork_errors.erl					\
		   yamerl_the_fork_parser.erl					\
		   yamerl_the_fork_constr.erl					\
		   yamerl_the_fork_node_seq.erl					\
		   yamerl_the_fork_node_map.erl					\
		   yamerl_the_fork_node_str.erl					\
		   yamerl_the_fork_node_str_json.erl				\
		   yamerl_the_fork_node_null.erl					\
		   yamerl_the_fork_node_null_json.erl				\
		   yamerl_the_fork_node_bool.erl					\
		   yamerl_the_fork_node_bool_json.erl				\
		   yamerl_the_fork_node_bool_ext.erl				\
		   yamerl_the_fork_node_int.erl					\
		   yamerl_the_fork_node_int_json.erl				\
		   yamerl_the_fork_node_int_ext.erl				\
		   yamerl_the_fork_node_float.erl				\
		   yamerl_the_fork_node_float_json.erl				\
		   yamerl_the_fork_node_float_ext.erl				\
		   yamerl_the_fork_node_size.erl					\
		   yamerl_the_fork_node_timestamp.erl				\
		   yamerl_the_fork_node_ipaddr.erl				\
		   yamerl_the_fork_node_erlang_atom.erl				\
		   yamerl_the_fork_node_erlang_fun.erl				\
		   yamerl_the_fork_yamler_compat.erl				\
		   yamerl_the_fork.erl

CLEANFILES = Emakefile

all-local: Emakefile
	@$(ERL) +B -noshell						\
		-pa @top_builddir@/ebin					\
		-eval "case make:all() of				\
		         up_to_date ->					\
			   halt(0);					\
		         Err ->						\
		           io:format(\"~p~n\", [Err]),			\
		           halt(1)					\
		       end"

# Emakefile is generated automatically with the source files declared above.
Emakefile: Makefile.am Emakefile.in
	@echo "Generate: $@"
	@$(AWK) -v src='$(dist_erlsrc_DATA)'				\
	"{ print }							\
	/% DO NOT EDIT: Modules list is generated/ {			\
		indent = index(\$$0, \"%\");				\
		indent = substr(\$$0, 1, indent - 1);			\
		split(src, files);					\
		files_count = 0;					\
		for (file in files) {					\
			files_count++					\
		}							\
		mods_count = 0;						\
		for (i = 1; i <= files_count; i++) {			\
			if (files[i] !~ /\.erl$$/)			\
				continue;				\
			mods[++mods_count] = files[i]			\
		}							\
		for (i = 1; i <= mods_count; i++) {			\
			mod = mods[i];					\
			sub(/\.erl/, \"\", mod);			\
			if (i != mods_count)				\
				print indent \"'$(srcdir)/\" mod \"',\";\
			else						\
				print indent \"'$(srcdir)/\" mod \"'\"	\
		}							\
	}" Emakefile.in > $@
