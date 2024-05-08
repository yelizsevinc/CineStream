using System.ComponentModel.DataAnnotations;

namespace CineStream.Data;

public class PlatformUser
{
    public int PlatformUserId { get; set; }
    public int PlatformId { get; set; }
    public int UserId { get; set; }
    public DateTime? SubscriptionDate { get; set; }
}




