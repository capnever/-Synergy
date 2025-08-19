export const PageList = ({ pages, selectedPageId, onSelect }) => {
    return (
      <div className="w-[800px] flex flex-row rounded-2xl bg-cyan-950 text-gray-300 justify-evenly">
        {pages.map((page) => (
          <div
            key={page.id}
            onClick={() => onSelect(page.id)}
            className={`block py-2 px-2 text-[14pt] hover:bg-cyan-700 hover:cursor-pointer w-full rounded-2xl ${
              selectedPageId === page.id ? 'bg-cyan-900' : ''
            }`}
          >
            {page.name}
          </div>
        ))}
      </div>
    );
  };