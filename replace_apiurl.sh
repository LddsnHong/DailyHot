#!/bin/bash  
  
find '/usr/share/nginx/html' -name '*.js' -exec sed -i -e 's,vitegloalapi,'"$VITE_GLOBAL_API"',g' {} \;  
  
find '/usr/share/nginx/html' -name '*.js' -exec sed -i -e 's,viteicp,'"$VITE_ICP"',g' {} \;  
  
nginx -g "daemon off;"