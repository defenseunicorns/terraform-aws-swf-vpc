package test_test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/require"
)

const (
	awsRegionVar       = "region"
  expectedNamePrefix = "terratest"
  nameOutput         = "name"
  namePrefixVar      = "name_prefix"
  testDir            = "../examples/complete"
)

var approvedRegions = []string{"us-east-1", "us-east-2", "us-west-1", "us-west-2"}

func TestVPCModule(t *testing.T) {
	awsRegion := aws.GetRandomStableRegion(t, approvedRegions, nil)

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: testDir,
		Vars: map[string]interface{}{
			awsRegionVar: awsRegion,
      namePrefixVar: expectedNamePrefix,
		},
	})

  defer terraform.Destroy(t, terraformOptions)
  terraform.InitAndApply(t, terraformOptions)

  actualName := terraform.Output(t, terraformOptions, nameOutput)
  require.Contains(t, actualName, expectedNamePrefix)
}
