// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go k8s.io/api/core/v1

package v1

LabelHostname:          "kubernetes.io/hostname"
LabelZoneFailureDomain: "failure-domain.beta.kubernetes.io/zone"
LabelZoneRegion:        "failure-domain.beta.kubernetes.io/region"
LabelInstanceType:      "beta.kubernetes.io/instance-type"
LabelOSStable:          "kubernetes.io/os"
LabelArchStable:        "kubernetes.io/arch"

// LabelNamespaceSuffixKubelet is an allowed label namespace suffix kubelets can self-set ([*.]kubelet.kubernetes.io/*)
LabelNamespaceSuffixKubelet: "kubelet.kubernetes.io"

// LabelNamespaceSuffixNode is an allowed label namespace suffix kubelets can self-set ([*.]node.kubernetes.io/*)
LabelNamespaceSuffixNode: "node.kubernetes.io"

// LabelNamespaceNodeRestriction is a forbidden label namespace that kubelets may not self-set when the NodeRestriction admission plugin is enabled
LabelNamespaceNodeRestriction: "node-restriction.kubernetes.io"

// IsHeadlessService is added by Controller to an Endpoint denoting if its parent
// Service is Headless. The existence of this label can be used further by other
// controllers and kube-proxy to check if the Endpoint objects should be replicated when
// using Headless Services
IsHeadlessService: "service.kubernetes.io/headless"
