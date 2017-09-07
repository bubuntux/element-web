#!/bin/bash
docker_versions=`curl -sSL 'https://registry.hub.docker.com/v2/repositories/bubuntux/riot-web/tags?page_size=1024' | jq '."results"[]["name"]' | tr -d '"' | sort --version-sort`
riot_versions=`git ls-remote --tags --refs https://github.com/vector-im/riot-web | awk '{print $2}' | sed 's|^refs/tags/||' | sort --version-sort`

docker_login () {
	if [ -z "$docker_login_flag" ]; then
		docker login -u ${DOCKER_USER} -p ${DOCKER_PASS}
		docker_login_flag=true
	fi
}

process_versions () {
	for riot_version in $@ ; do
		found=false
		for docker_version in $docker_versions ; do
			if [[ $docker_version == $riot_version ]]; then
				found=true
				break
			fi
	    	done
		if $found ; then
			echo "Version ${riot_version} already in docker."
	  		continue
		fi
		docker build -t bubuntux/riot-web:$riot_version --build-arg version=$riot_version .
		docker_login
		docker push bubuntux/riot-web:$riot_version
		latest_version=$riot_version
	done
}

process_versions `echo $riot_versions | tr ' ' '\n' | grep -e "rc" | tail -n 5` # release candidates
latest_version='' # do not set an rc version as latest
process_versions `echo $riot_versions | tr ' ' '\n' | grep -ve "rc" | tail -n 5` # stables

if [ ! -z "$latest_version" ]; then
	docker tag bubuntux/riot-web:$latest_version bubuntux/riot-web:latest
	docker push bubuntux/riot-web:latest
fi
