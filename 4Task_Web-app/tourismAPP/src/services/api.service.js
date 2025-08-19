export const ApiService = {
    async getPages() {
      const response = await fetch('http://localhost:5142/countries');
      if (!response.ok) throw new Error('Failed to fetch pages');
      return await response.json();
    },
  
    async getPageItems(countryId) {
      const response = await fetch(`http://localhost:5142/hotels/${countryId}`);
      if (!response.ok) throw new Error('Failed to fetch page items');
      return await response.json();
    }
  };