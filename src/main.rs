#[macro_use] extern crate rocket;

#[get("/")]
fn index() -> &'static str {
    "Welcome To cliuno template Rocket Server!"
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}