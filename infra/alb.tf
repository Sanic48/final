resource "aws_alb" "iteaalb" {
  name            = "itea-alb"
  subnets         = ["${aws_subnet.public.id}", "${aws_subnet.public-2.id}"]
  security_groups = ["${aws_security_group.ecs_cluster.id}"]
//  internal         = true
}

resource "aws_alb_listener" "http" {
  load_balancer_arn = "${aws_alb.iteaalb.id}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "WORKS GREAT"
      status_code = "200"
    }
  }
}
