$pathToGitRoot = "C:/Users/Alex/Repositories/Mensural-Detector"
$pathToSourceRoot = "$($pathToGitRoot)/tensorflow_object_detection"
$pathToTranscript = "$($pathToSourceRoot)/Transcripts"
cd $pathToSourceRoot

################################################################
# Available configurations - uncomment the one to actually run #
################################################################
# $configuration = "faster_rcnn_inception_resnet_v2_atrous"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_600_proposals_pretrained"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_1200_proposals"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_1200_proposals_max_suppr_09"
$configuration = "faster_rcnn_inception_resnet_v2_atrous_1200_proposals_max_suppr_03"
# $configuration = "faster_rcnn_inception_resnet_v2_atrous_1200_proposals_only_rpn"

Start-Transcript -path "$($pathToTranscript)/ValidateModel-$($configuration).txt" -append
echo "Validate with $($configuration) configuration"
python eval.py --logtostderr --pipeline_config_path="$($pathToSourceRoot)/configurations/$($configuration).config" --checkpoint_dir="$($pathToSourceRoot)/data/checkpoints-$($configuration)-train" --eval_dir="$($pathToSourceRoot)/data/checkpoints-$($configuration)-validate"
Stop-Transcript
