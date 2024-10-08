using System.ComponentModel.DataAnnotations;

namespace CineStream.Data;

public class Show
{
    public int ShowId { get; set; }
    [Required]
    [StringLength(200, ErrorMessage = "Title cannot exceed 200 characters.")]
    public string? Title { get; set; }
    public string? Details { get; set; }
    public DateTime? ReleaseDate { get; set; }
    public DateTime? CreatedAt { get; set; }
}
