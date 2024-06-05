using System.ComponentModel.DataAnnotations;

namespace CineStream.Data;

public class PlatformShow
{
    public int PlatformShowId { get; set; }
    public int PlatformId { get; set; }
    public int ShowId { get; set; }
    public DateTime? AddedToPlatformDate { get; set; }
}
