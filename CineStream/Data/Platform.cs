using System.ComponentModel.DataAnnotations;

namespace CineStream.Data;

public class Platform
{
    public int PlatformId { get; set; }
    [Required]
    [StringLength(128, ErrorMessage = "Name cannot exceed 128 characters.")]
    public string? Name { get; set; }
}




