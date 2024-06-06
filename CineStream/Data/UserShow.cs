using System.ComponentModel.DataAnnotations;

namespace CineStream.Data;

public class UserShow
{
    public int UserShowId { get; set; }
    public int UserId { get; set; }
    public int ShowId { get; set; }
    public Boolean Watched { get; set; }
    public DateTime? CreatedAt { get; set; }
}
