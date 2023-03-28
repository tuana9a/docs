# jenkins

just some stuff needed for my jenkins

## how to get secrect file path

[https://stackoverflow.com/questions/75147919/jenkins-how-to-access-a-secret-file](https://stackoverflow.com/questions/75147919/jenkins-how-to-access-a-secret-file)

[https://www.jenkins.io/doc/pipeline/steps/credentials-binding/](https://www.jenkins.io/doc/pipeline/steps/credentials-binding/)

[https://docs.cloudbees.com/docs/cloudbees-ci/latest/cloud-secure-guide/injecting-secrets](https://docs.cloudbees.com/docs/cloudbees-ci/latest/cloud-secure-guide/injecting-secrets)

```groovy
withCredentials([file(credentialsId: 'youCredId', variable: 'secretFile')]) {
    // do something with the file, for instance 
    sh 'cat $secretFile'
}
```

```groovy
withCredentials([
    usernamePassword(
        credentialsId: 'mycompany-github-creds',
        passwordVariable: 'pass',
        usernameVariable: 'user'
    )
]) {
    // the code here can access $pass and $user
}
```

## how to trigger from github webhook in multibranch pipeline

[https://stackoverflow.com/questions/35781817/trigger-workflow-on-github-push-pipeline-plugin-multibranch-configuration](https://stackoverflow.com/questions/35781817/trigger-workflow-on-github-push-pipeline-plugin-multibranch-configuration)

ensure github plugin installed

note that in multi branch pipeline, each branch will create a sub pipeline with its name.
to config `GitHub hook trigger for GITScm polling` you need to place it in Jenkinsfile directly

```groovy
pipeline {
    // ...
    triggers {
        githubPush()
    }
    // ...
}
```

## handbook

[https://www.jenkins.io/doc/book/getting-started/](https://www.jenkins.io/doc/book/getting-started/)

## refs

[https://javadoc.jenkins.io/plugin/docker-workflow/](https://javadoc.jenkins.io/plugin/docker-workflow/)
