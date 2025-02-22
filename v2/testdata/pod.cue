apiVersion: "v1"
kind:       "Pod"
metadata: {
	annotations: {
		"kubernetes.io/config.hash":                  "3249315999fbc9188c7cd055daf4664a"
		"kubernetes.io/config.mirror":                "3249315999fbc9188c7cd055daf4664a"
		"kubernetes.io/config.seen":                  "2018-09-21T02:45:02.657174998Z"
		"kubernetes.io/config.source":                "file"
		"scheduler.alpha.kubernetes.io/critical-pod": ""
	}
	creationTimestamp: "2018-09-21T02:45:22Z"
	labels: {
		component: "kube-controller-manager"
		tier:      "control-plane"
	}
	name:            "kube-controller-manager-ip-10-0-0-7"
	namespace:       "kube-system"
	resourceVersion: "257"
	selfLink:        "/api/v1/namespaces/kube-system/pods/kube-controller-manager-ip-10-0-0-7"
	uid:             "62be5b6b-bd48-11e8-a562-02bcfded4630"
}
spec: {
	containers: [{
		command: [
			"kube-controller-manager",
			"--address=127.0.0.1",
			"--authentication-kubeconfig=/etc/kubernetes/controller-manager.conf",
			"--authorization-kubeconfig=/etc/kubernetes/controller-manager.conf",
			"--client-ca-file=/etc/kubernetes/pki/ca.crt",
			"--cluster-signing-cert-file=/etc/kubernetes/pki/ca.crt",
			"--cluster-signing-key-file=/etc/kubernetes/pki/ca.key",
			"--controllers=*,bootstrapsigner,tokencleaner",
			"--kubeconfig=/etc/kubernetes/controller-manager.conf",
			"--leader-elect=true",
			"--requestheader-client-ca-file=/etc/kubernetes/pki/front-proxy-ca.crt",
			"--root-ca-file=/etc/kubernetes/pki/ca.crt",
			"--service-account-private-key-file=/etc/kubernetes/pki/sa.key",
			"--use-service-account-credentials=true",
		]
		image:           "k8s.gcr.io/kube-controller-manager:v1.13.0-alpha.0"
		imagePullPolicy: "IfNotPresent"
		livenessProbe: {
			failureThreshold: 8
			httpGet: {
				host:   "127.0.0.1"
				path:   "/healthz"
				port:   10252
				scheme: "HTTP"
			}
			initialDelaySeconds: 15
			periodSeconds:       10
			successThreshold:    1
			timeoutSeconds:      15
		}
		name: "kube-controller-manager"
		resources requests cpu: "200m"
		terminationMessagePath:   "/dev/termination-log"
		terminationMessagePolicy: "File"
		volumeMounts: [{
			mountPath: "/etc/ca-certificates"
			name:      "etc-ca-certificates"
			readOnly:  true
		}, {
			mountPath: "/etc/kubernetes/pki"
			name:      "k8s-certs"
			readOnly:  true
		}, {
			mountPath: "/etc/ssl/certs"
			name:      "ca-certs"
			readOnly:  true
		}, {
			mountPath: "/etc/kubernetes/controller-manager.conf"
			name:      "kubeconfig"
			readOnly:  true
		}, {
			mountPath: "/etc/pki"
			name:      "etc-pki"
			readOnly:  true
		}, {
			mountPath: "/usr/share/ca-certificates"
			name:      "usr-share-ca-certificates"
			readOnly:  true
		}, {
			mountPath: "/usr/local/share/ca-certificates"
			name:      "usr-local-share-ca-certificates"
			readOnly:  true
		}]
	}]
	dnsPolicy:         "ClusterFirst"
	hostNetwork:       true
	nodeName:          "ip-10-0-0-7"
	priority:          2000000000
	priorityClassName: "system-cluster-critical"
	restartPolicy:     "Always"
	schedulerName:     "default-scheduler"
	securityContext: {}
	terminationGracePeriodSeconds: 30
	tolerations: [{
		effect:   "NoExecute"
		operator: "Exists"
	}]
	volumes: [{
		hostPath: {
			path: "/etc/kubernetes/pki"
			type: "DirectoryOrCreate"
		}
		name: "k8s-certs"
	}, {
		hostPath: {
			path: "/etc/ssl/certs"
			type: "DirectoryOrCreate"
		}
		name: "ca-certs"
	}, {
		hostPath: {
			path: "/etc/kubernetes/controller-manager.conf"
			type: "FileOrCreate"
		}
		name: "kubeconfig"
	}, {
		hostPath: {
			path: "/etc/pki"
			type: "DirectoryOrCreate"
		}
		name: "etc-pki"
	}, {
		hostPath: {
			path: "/usr/share/ca-certificates"
			type: "DirectoryOrCreate"
		}
		name: "usr-share-ca-certificates"
	}, {
		hostPath: {
			path: "/usr/local/share/ca-certificates"
			type: "DirectoryOrCreate"
		}
		name: "usr-local-share-ca-certificates"
	}, {
		hostPath: {
			path: "/etc/ca-certificates"
			type: "DirectoryOrCreate"
		}
		name: "etc-ca-certificates"
	}]
}
status: {
	conditions: [{
		lastProbeTime:      null
		lastTransitionTime: "2018-09-21T02:45:03Z"
		status:             "True"
		type:               "Initialized"
	}, {
		lastProbeTime:      null
		lastTransitionTime: "2018-09-21T02:45:45Z"
		message:            "containers with unready status: [kube-controller-manager]"
		reason:             "ContainersNotReady"
		status:             "False"
		type:               "Ready"
	}, {
		lastProbeTime:      null
		lastTransitionTime: "2018-09-21T02:45:45Z"
		message:            "containers with unready status: [kube-controller-manager]"
		reason:             "ContainersNotReady"
		status:             "False"
		type:               "ContainersReady"
	}, {
		lastProbeTime:      null
		lastTransitionTime: "2018-09-21T02:45:03Z"
		status:             "True"
		type:               "PodScheduled"
	}]
	containerStatuses: [{
		containerID: "containerd://2ed53aaff98f5d882d987fec63681aa3a95164970e32e4f4a06071686637e1fe"
		image:       "k8s.gcr.io/kube-controller-manager:v1.13.0-alpha.0"
		imageID:     "k8s.gcr.io/kube-controller-manager@sha256:3d1c2154b9f777f30203bcc9bb0e99acb3bc0fc0095c8e1239b8ab0182d200d5"
		lastState terminated: {
			containerID: "containerd://2ed53aaff98f5d882d987fec63681aa3a95164970e32e4f4a06071686637e1fe"
			exitCode:    1
			finishedAt:  "2018-09-21T02:45:44Z"
			reason:      "Error"
			startedAt:   "2018-09-21T02:45:44Z"
		}
		name:         "kube-controller-manager"
		ready:        false
		restartCount: 3
		state waiting: {
			message: "Back-off 40s restarting failed container=kube-controller-manager pod=kube-controller-manager-ip-10-0-0-7_kube-system(3249315999fbc9188c7cd055daf4664a)"

			reason: "CrashLoopBackOff"
		}
	}]
	hostIP:    "10.0.0.7"
	phase:     "Running"
	podIP:     "10.0.0.7"
	qosClass:  "Burstable"
	startTime: "2018-09-21T02:45:03Z"
}
