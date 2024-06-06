using System.ComponentModel.DataAnnotations;

namespace CineStream.Data;

public class User
{
    public int UserId { get; set; }
    [Required]
    [StringLength(100, ErrorMessage = "Username cannot exceed 100 characters.")]
    public string? Username { get; set; }
    [Required]
    [StringLength(255, ErrorMessage = "Email cannot exceed 255 characters.")]
    public string? Email { get; set; }
    public DateTime? CreatedAt { get; set; }
}
