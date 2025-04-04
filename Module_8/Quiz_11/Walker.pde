public class Walker
{
    PVector position = new PVector();
    PVector velocity = new PVector();
    PVector acceleration = new PVector();

    float velocityLimit = 10;
    float scale = 15;
    float mass = 1;

    float r = random(256), g = random(256), b = random(256);
    float gravitationalConstant = 1;

    public void applyForce(PVector force)
    {
        acceleration.add(PVector.div(force, mass));
    }

    public void update()
    {
        velocity.add(acceleration);
        velocity.limit(velocityLimit);
        position.add(velocity);
        acceleration.mult(0); // Reset acceleration
    }

    public void render()
    {
        fill(r, g, b, 100);
        noStroke();
        circle(position.x, position.y, scale);
    }

    public void checkEdges()
    {
        if (position.x >= Window.right || position.x <= Window.left)
        {
            velocity.x *= -1;
        }
        if (position.y >= Window.top || position.y <= Window.bottom)
        {
            velocity.y *= -1;
        }
    }

    public PVector calculateAttraction(Walker walker)
    {
        PVector force = PVector.sub(position, walker.position);
        float distance = constrain(force.mag(), 5, 25);
        force.normalize();

        float strength = (gravitationalConstant * mass * walker.mass) / (distance * distance);
        return force.mult(strength);
    }
}
