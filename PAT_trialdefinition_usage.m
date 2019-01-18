%%usage of PAT_trialdefinition function

%When calling ft_definetrial, you would specify

cfg = ...
cfg.trialfun = 'PAT_trialdefinition';
cfg.trialdef.pre  = 0.5;
cfg.trialdef.post = 1.0;

%and you would call

cfg = ft_definetrial(cfg);

%followed by

data = ft_preprocessing(cfg);