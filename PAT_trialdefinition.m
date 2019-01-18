function [trl, event] = PAT_trialdefinition(cfg);
%fieldtrip function to process trial definition over different sorts of trials (different trial length).
% found here: http://www.fieldtriptoolbox.org/example/making_your_own_trialfun_for_conditional_trial_definition
% adapted within loop


% read the header information and the events from the data
hdr   = ft_read_header(cfg.dataset);
event = ft_read_event(cfg.dataset);

% search for "trigger" events
value  = [event(find(strcmp('trigger', {event.type}))).value]';
sample = [event(find(strcmp('trigger', {event.type}))).sample]';

% determine the number of samples before and after the trigger
pretrig  = -round(cfg.trialdef.pre  * hdr.Fs);
posttrig =  round(cfg.trialdef.post * hdr.Fs);

% look for the combination of a trigger "tone (1-12)" followed by a trigger "response (button/15s over)" 
% for each trigger except the last one
trl = [];
for j = 1:(length(value)-1)
  trg1 = value(j);
  trg2 = value(j+1);
  %change the following line to only obtain certain trials (e.g. button press)
  if trg1==101|102|103|104|105|106|107|108|109|110|111|112 && trg2==201|202 
    trlbegin = sample(j) + pretrig;       
    trlend   = sample(j+1) + posttrig;   % adapted here: take time of 2nd trigger! not of first (j)   
    offset   = pretrig;
    newtrl   = [trlbegin trlend offset];
    trl      = [trl; newtrl];
  end
end