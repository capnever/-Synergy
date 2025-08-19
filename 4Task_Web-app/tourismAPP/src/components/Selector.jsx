import { useEffect, useState } from 'react';
import { ApiService } from '../services/api.service';

export const Selector = ({ pages, selectedPageId, onSelect }) => {
  const [items, setItems] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!selectedPageId) return;

    const fetchItems = async () => {
      try {
        setLoading(true);
        setError(null);
        const data = await ApiService.getPageItems(selectedPageId);
        setItems(data);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchItems();
  }, [selectedPageId]);

  if (loading) return <div>Loading items...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <div className="w-[800px] mt-2 flex flex-col rounded-2xl bg-cyan-950 text-gray-300 justify-evenly">
      {items.map((item) => (
        <div
          key={item.id}
          className="block py-1 px-1 text-[12pt] hover:bg-cyan-700 hover:cursor-pointer w-full rounded-2xl"
        >
          {item.name}
        </div>
      ))}
    </div>
  );
};