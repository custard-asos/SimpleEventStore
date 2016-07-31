using System.Collections.Generic;
using System.Threading.Tasks;

namespace SimpleEventStore
{
    public interface IStorageEngine
    {
        Task AppendToStream(string streamId, IEnumerable<StorageEvent> events);

        Task<IEnumerable<StorageEvent>> ReadStreamForwards(string streamId);
    }
}