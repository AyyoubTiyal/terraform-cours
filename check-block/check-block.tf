# Before
data "http" "example" {
  url = "https://www.google.com"
}

resource "local_file" "foo" {
  content = "hi"
  filename = "${path.module}/foo.txt"
}

# After
# to use the check block we need to enable the feature flag in the terraform block
# and it used to not block the apply if the condition is not met
check "website-check" {
    data "http" "web" {
        url = "https://www.google.com"
    }
    assert {
        condition    = data.http.example.status_code == 200
        error_message  = "Website is down"
    }
}