function linkfun_db_edit(hObj)

% FIXHELPINFO
% 
% LINKFUN_DB_EDIT
% Link function that spawns fuzzy gui for 
% eegDb commands. After the command has been
% chosen LINKFUN_DB_EDIT opens relevant gui
% and after edits have been made - checks 
% these and applies to the database
%
% input:
% hObj - handle to the eegDb figure

commands = {...
	'filter - edit',...
	'epoch - edit',...
	'find file', ...
	'plot and mark',...
	'multiselect',...
	'explore components'...
	};


func = {...
	@linkfun_filter_edit,...
	'',...
	@linkfun_findfile, ...
	'plot and mark',...
	@linkfun_multiselect,...
	@linkfun_compexplore ...
};

com = fuzzy_gui(commands);

% if user aborts - return
if isempty(com) || com == 0
	return
end

% if func for this command is empty - display error
if isempty(func{com})
	error('Command not implemented');
else
	% else - evaluate
	feval(func{com}, hObj);
end

