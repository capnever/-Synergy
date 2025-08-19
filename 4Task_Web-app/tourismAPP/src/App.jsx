import { useState, useEffect } from 'react';
import './App.css';
import { PageList } from './components/PageList';
import { Selector } from './components/Selector';
import { ApiService } from './services/api.service';

function App() {
  const [pages, setPages] = useState([]);
  const [selectedPageId, setSelectedPageId] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchPages = async () => {
      try {
        setLoading(true);
        const data = await ApiService.getPages();
        setPages(data);
        if (data.length > 0) setSelectedPageId(data[0].id);
      } catch (err) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };

    fetchPages();
  }, []);

  if (loading) return <div>Loading pages...</div>;
  if (error) return <div>Error: {error}</div>;

  return (
    <>
      <h1 className="pt-[200px] pb-[40px]">Tourism APP</h1>
      
      <PageList 
        pages={pages} 
        selectedPageId={selectedPageId} 
        onSelect={setSelectedPageId} 
      />
      
      {selectedPageId && <Selector selectedPageId={selectedPageId} />}
    </>
  );
}

export default App;