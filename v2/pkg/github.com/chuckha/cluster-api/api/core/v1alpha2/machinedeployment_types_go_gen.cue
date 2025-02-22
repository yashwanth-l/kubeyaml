// Code generated by cue get go. DO NOT EDIT.

//cue:generate cue get go github.com/chuckha/cluster-api/api/core/v1alpha2

package v1alpha2

import (
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/util/intstr"
)

MachineDeploymentStrategyType: string // enumMachineDeploymentStrategyType

enumMachineDeploymentStrategyType:
	RollingUpdateMachineDeploymentStrategyType

// Replace the old MachineSet by new one using rolling update
// i.e. gradually scale down the old MachineSet and scale up the new one.
RollingUpdateMachineDeploymentStrategyType: MachineDeploymentStrategyType & "RollingUpdate"

/// [MachineDeploymentSpec]
// MachineDeploymentSpec defines the desired state of MachineDeployment
MachineDeploymentSpec: {
	// Number of desired machines. Defaults to 1.
	// This is a pointer to distinguish between explicit zero and not specified.
	replicas?: null | int32 @go(Replicas,*int32)

	// Label selector for machines. Existing MachineSets whose machines are
	// selected by this will be the ones affected by this deployment.
	// It must match the machine template's labels.
	selector: metav1.LabelSelector @go(Selector)

	// Template describes the machines that will be created.
	template: MachineTemplateSpec @go(Template)

	// The deployment strategy to use to replace existing machines with
	// new ones.
	// +optional
	strategy?: null | MachineDeploymentStrategy @go(Strategy,*MachineDeploymentStrategy)

	// Minimum number of seconds for which a newly created machine should
	// be ready.
	// Defaults to 0 (machine will be considered available as soon as it
	// is ready)
	// +optional
	minReadySeconds?: null | int32 @go(MinReadySeconds,*int32)

	// The number of old MachineSets to retain to allow rollback.
	// This is a pointer to distinguish between explicit zero and not specified.
	// Defaults to 1.
	// +optional
	revisionHistoryLimit?: null | int32 @go(RevisionHistoryLimit,*int32)

	// Indicates that the deployment is paused.
	// +optional
	paused?: bool @go(Paused)

	// The maximum time in seconds for a deployment to make progress before it
	// is considered to be failed. The deployment controller will continue to
	// process failed deployments and a condition with a ProgressDeadlineExceeded
	// reason will be surfaced in the deployment status. Note that progress will
	// not be estimated during the time a deployment is paused. Defaults to 600s.
	progressDeadlineSeconds?: null | int32 @go(ProgressDeadlineSeconds,*int32)
}

/// [MachineDeploymentStrategy]
// MachineDeploymentStrategy describes how to replace existing machines
// with new ones.
MachineDeploymentStrategy: {
	// Type of deployment. Currently the only supported strategy is
	// "RollingUpdate".
	// Default is RollingUpdate.
	// +optional
	type?: MachineDeploymentStrategyType @go(Type)

	// Rolling update config params. Present only if
	// MachineDeploymentStrategyType = RollingUpdate.
	// +optional
	rollingUpdate?: null | MachineRollingUpdateDeployment @go(RollingUpdate,*MachineRollingUpdateDeployment)
}

/// [MachineRollingUpdateDeployment]
// Spec to control the desired behavior of rolling update.
MachineRollingUpdateDeployment: {
	// The maximum number of machines that can be unavailable during the update.
	// Value can be an absolute number (ex: 5) or a percentage of desired
	// machines (ex: 10%).
	// Absolute number is calculated from percentage by rounding down.
	// This can not be 0 if MaxSurge is 0.
	// Defaults to 0.
	// Example: when this is set to 30%, the old MachineSet can be scaled
	// down to 70% of desired machines immediately when the rolling update
	// starts. Once new machines are ready, old MachineSet can be scaled
	// down further, followed by scaling up the new MachineSet, ensuring
	// that the total number of machines available at all times
	// during the update is at least 70% of desired machines.
	// +optional
	maxUnavailable?: null | intstr.IntOrString @go(MaxUnavailable,*intstr.IntOrString) @protobuf(1,bytes,opt)

	// The maximum number of machines that can be scheduled above the
	// desired number of machines.
	// Value can be an absolute number (ex: 5) or a percentage of
	// desired machines (ex: 10%).
	// This can not be 0 if MaxUnavailable is 0.
	// Absolute number is calculated from percentage by rounding up.
	// Defaults to 1.
	// Example: when this is set to 30%, the new MachineSet can be scaled
	// up immediately when the rolling update starts, such that the total
	// number of old and new machines do not exceed 130% of desired
	// machines. Once old machines have been killed, new MachineSet can
	// be scaled up further, ensuring that total number of machines running
	// at any time during the update is at most 130% of desired machines.
	// +optional
	maxSurge?: null | intstr.IntOrString @go(MaxSurge,*intstr.IntOrString) @protobuf(2,bytes,opt)
}

/// [MachineDeploymentStatus]
// MachineDeploymentStatus defines the observed state of MachineDeployment
MachineDeploymentStatus: {
	// The generation observed by the deployment controller.
	// +optional
	observedGeneration?: int64 @go(ObservedGeneration) @protobuf(1,varint,opt)

	// Selector is the same as the label selector but in the string format to avoid introspection
	// by clients. The string will be in the same format as the query-param syntax.
	// More info about label selectors: http://kubernetes.io/docs/user-guide/labels#label-selectors
	// +optional
	selector?: string @go(Selector)

	// Total number of non-terminated machines targeted by this deployment
	// (their labels match the selector).
	// +optional
	replicas?: int32 @go(Replicas) @protobuf(2,varint,opt)

	// Total number of non-terminated machines targeted by this deployment
	// that have the desired template spec.
	// +optional
	updatedReplicas?: int32 @go(UpdatedReplicas) @protobuf(3,varint,opt)

	// Total number of ready machines targeted by this deployment.
	// +optional
	readyReplicas?: int32 @go(ReadyReplicas) @protobuf(7,varint,opt)

	// Total number of available machines (ready for at least minReadySeconds)
	// targeted by this deployment.
	// +optional
	availableReplicas?: int32 @go(AvailableReplicas) @protobuf(4,varint,opt)

	// Total number of unavailable machines targeted by this deployment.
	// This is the total number of machines that are still required for
	// the deployment to have 100% available capacity. They may either
	// be machines that are running but not yet available or machines
	// that still have not been created.
	// +optional
	unavailableReplicas?: int32 @go(UnavailableReplicas) @protobuf(5,varint,opt)
}

/// [MachineDeployment]
// MachineDeployment is the Schema for the machinedeployments API
MachineDeployment: metav1.TypeMeta & {
	metadata?: metav1.ObjectMeta       @go(ObjectMeta)
	spec?:     MachineDeploymentSpec   @go(Spec)
	status?:   MachineDeploymentStatus @go(Status)
}

// MachineDeploymentList contains a list of MachineDeployment
MachineDeploymentList: metav1.TypeMeta & {
	metadata?: metav1.ListMeta @go(ListMeta)
	items: [...MachineDeployment] @go(Items,[]MachineDeployment)
}
