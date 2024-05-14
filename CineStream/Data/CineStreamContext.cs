using System.Diagnostics;
using Microsoft.EntityFrameworkCore;

namespace CineStream.Data;

// Context for the owners database.
public class CineStreamContext : DbContext
{
    public CineStreamContext(DbContextOptions<CineStreamContext> options)
        : base(options)
    {
        Debug.WriteLine($"{ContextId} context created.");
    }

    // List of Owner.
    public DbSet<Platform>? Platforms { get; set; }
    public DbSet<Show>? Shows { get; set; }
    public DbSet<User>? Users { get; set; }
    public DbSet<PlatformUser>? PlatformUsers { get; set; }
    public DbSet<PlatformShow>? PlatformShows { get; set; }

    // Define the model.
    // modelBuilder: The ModelBuilder.
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // This property isn't on the C# class,
        // so we set it up as a "shadow" property and use it for concurrency.
        modelBuilder.Entity<Platform>();

        base.OnModelCreating(modelBuilder);
    }

    // Dispose pattern.
    public override void Dispose()
    {
        Debug.WriteLine($"{ContextId} context disposed.");
        base.Dispose();
    }

    // Dispose pattern.
    public override ValueTask DisposeAsync()
    {
        Debug.WriteLine($"{ContextId} context disposed async.");
        return base.DisposeAsync();
    }
}
