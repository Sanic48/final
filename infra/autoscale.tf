
resource "aws_autoscaling_group" "ecs-autoscaling-group" {
name                 = "ecs-autoscaling-group"
vpc_zone_identifier  = ["${aws_subnet.public.id}", "${aws_subnet.public-2.id}"]
launch_configuration    = "${aws_launch_configuration.ecs-launch-configuration.name}"
//desired_capacity     = "${var.desired_capacity}"
desired_capacity     = 4
min_size             = "${var.min_size}"
max_size             = "${var.max_size}"
health_check_type    = "ELB"
}




