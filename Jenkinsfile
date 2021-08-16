node {
    stage("Git Check"){
	    	
		sh 'git clone https://github.com/sachinkn777/cidc-webpage.git'
		sh 'ls -ltr '
	    	
    }

    stage("Docker build"){
        sh 'docker version'
	sh 'cd cicd-webapp/cidc-webpage/'
	sh 'ls -ltr'
	sh 'pwd'
        sh 'docker build -t asia.gcr.io/metallic-slider/metallic-slider:v11 .'
        sh 'docker image list'
	sh 'gcloud auth activate-service-account junkins-master@metallic-slider.iam.gserviceaccount.com --key-file=/var/lib/jenkins/metallic-slider-1b482ff0dbd1.json'
        sh 'gcloud auth configure-docker -q'
	sh 'gcloud auth list'
	sh 'docker push asia.gcr.io/metallic-slider/metallic-slider:v11'
	sh 'rm -rf /var/lib/jenkins/workspace/cicd-webapp*'
    }

  
}
