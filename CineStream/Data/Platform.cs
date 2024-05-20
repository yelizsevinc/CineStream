using System.ComponentModel.DataAnnotations;

namespace CineStream.Data;

public class Platform
{
    public int PlatformId { get; set; }
    [Required]
    [StringLength(100, ErrorMessage = "Name cannot exceed 100 characters.")]
    public string? Name { get; set; }
    public DateTime? CreatedAt { get; set; }
}




