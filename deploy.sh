docker build -t dorakueyon/multi-client:latest -t dorakueyon/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t dorakueyon/multi-server:latest -t dorakueyon/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t dorakueyon/multi-worker:latest -t dorakueyon/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push dorakueyon/multi-client:latest
docker push dorakueyon/multi-server:latest
docker push dorakueyon/multi-worker:latest

docker push dorakueyon/multi-client:$SHA
docker push dorakueyon/multi-server:$SHA
docker push dorakueyon/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=dorakueyon/multi-server:$SHA
kubectl set image deployments/client-deployment client=dorakueyon/multi-client:$SHA
kubectl set image deployments/worker-deployment client=dorakueyon/multi-worker:$SHA
