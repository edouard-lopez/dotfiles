function pdm:activate --wraps='eval (pdm venv activate)' --description 'alias pdm:activate eval (pdm venv activate)'
  eval (pdm venv activate) $argv; 
end
