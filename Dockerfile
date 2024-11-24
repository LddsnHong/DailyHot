FROM node:18-alpine as build-deps

WORKDIR /app
COPY . ./
RUN npm i -g pnpm
RUN pnpm install
RUN pnpm build

FROM nginx:1.12-alpine    
MAINTAINER lddsnh<1340723643@qq.com>    

# 环境变量    
ENV VITE_GLOBAL_API "https://api-hot.efefee.cn"  
ENV VITE_ICP "琼ICP备2021006951号-4" 

# 拷贝静态文件    
COPY --from=build-deps /app/dist /usr/share/nginx/html

COPY replace_apiurl.sh ./replace_apiurl.sh
RUN chmod +x replace_apiurl.sh 

EXPOSE 80    
CMD ["sh", "replace_apiurl.sh"]