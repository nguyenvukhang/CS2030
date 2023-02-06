class Customer {
    Server server;

    Customer() {
        this.server = new Server(this);
    }
}
