CREATE DATABASE openSourceLibrary;

CREATE TABLE books
(
    book_id BIGSERIAL NOT NULL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    author VARCHAR(35) NOT NULL,
    ISBN VARCHAR(17) UNIQUE NOT NULL,
    year INTEGER NOT NULL,
    description VARCHAR(255),
    Language VARCHAR(10),
    published_on DATE NOT NULL,
    available_quantity INTEGER NOT NULL,
    category_id INTEGER NOT NULL
)
-- ALTER TABLE book ADD CONSTRAINT category_id_fk FOREIGN KEY (category_id) REFERENCES category(id);

INSERT INTO books
    (book_id, title, author, ISBN, year)
VALUES
    (1, 'A Game of Thrones', 'George R. R. Martin', '978-0553593716', 2003),
    (2, 'A Clash of Kings', 'George R. R. Martin', '978-0553593716', 2003),
    (3, 'A Storm of Swords', 'George R. R. Martin', '034554398X', 2003),
    (4, 'Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', '0439708184', 1999),
    (5, 'A Dance with Dragons', 'George R. R. Martin', '0553582011', 2013);
CREATE TABLE category
(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);
CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(150)NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    dob Date,
    phone VARCHAR (15) NOT NULL UNIQUE,
    email VARCHAR (50) NOT NULL UNIQUE,
    sex VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    active boolean DEFAULT false NOT NULL,
    CONSTRAINT users_pk PRIMARY KEY (user_id)

);


INSERT INTO users
    (user_id, first_name, last_name)
VALUES
    (1, 'Robert', 'Dickerson');


CREATE TABLE MEMBERS
(
    MEMBER_ID VARCHAR(35) PRIMARY KEY,
    MEMBER_NAME VARCHAR(35) NOT NULL,
    MAX_NO_BOOKS INT,
    MAX_NO_DAYS INT
);
CREATE TABLE BOOK_ISSUE
(
    MEMBER_ID VARCHAR(35) REFERENCES MEMBERS(MEMBER_ID),
    ACCESSION_NO VARCHAR(35) REFERENCES BOOK_RECORDS(ACCESSION_NO),
    ISSUE_DATE DATE NOT NULL,
    RETURN_DATE DATE,
    PRIMARY KEY(MEMBER_ID,ACCESSION_NO)
);



INSERT INTO books
    ("AssetId", "Title", "Author", "ISBN", "PublicationYear", "Language")
VALUES
    ('57e8c012-b5d6-42aa-abb2-c971e56c46e6', 'Wilderness Essays', 'John Muir', '1423607120', 2011, 'English'),
    ('8fa225e0-1221-43ab-a0a6-e1f57b696cf8', 'The Art of Living: Peace and Freedom in the Here and Now', 'Thich Nhat Hanh', '0062434667', 2017, 'English'),
    ('87d0b0dc-96b2-43d3-a4cf-f267e88f8509', 'The Origin of Consciousness in the Breakdown of the Bicameral Mind', 'Julian Jaynes', '', 1976, 'English'),
    ('c4de4767-a983-4e68-8e39-c1ebf0c05a4c', 'Thinking, Fast and Slow', 'Daniel Kahneman', '0374533555', 2013, 'English'),
    ('0bbc971e-392c-49ce-ac80-ec6d37542190', 'Memories, Dreams, Reflections', 'Carl Jung', '9780679723950', 1989, 'English'),
    ('38b09c82-9ea3-46e3-8f09-b6521aaac342', 'Fathers and Sons', 'Ivan Turgenev', '0553210890', 1862, 'English'),
    ('b5445eba-482e-4161-a039-1fcfc2a1983f', 'Classics of Russian Literature', 'Irwin Weil', '1423607120', 2011, 'English'),
    ('b6c45314-9701-4594-859b-76a554c861e0', 'To Build a Fire, and Other Stories (The World''s Best Reading)', 'Jack London', '0895775832', 1994, 'English'),
    ('78fa55fd-eaf9-4e24-9afa-ccf9124fbe04', 'Zen and the Art of Motorcycle Maintenance', 'Robert Pirsig', '0060839872', 1974, 'English'),
    ('0433fb15-32d4-457b-bed0-5677b49e351b', 'Sandworm: A New Era of Cyberwar and the Hunt for the Kremlin''s Most Dangerous Hackers', 'Andy Greenberg', '0525564632', 2019, 'English'),
    ('476323cf-1c69-45da-8fc9-492685a8bdb6', 'Dharma Bums', 'Jack Kerouac', '0140042520', 1976, 'English'),
    ('f2f2bfad-8576-4883-99ce-ff4af68ba1dd', 'Dress Your Family in Corduroy and Denim', 'David Sedaris', '9780316143462', 2004, 'English'),
    ('7243cdec-761f-4618-bab9-ab6d5b5b8557', 'Turing''s Cathedral: The Origins of the Digital Universe', 'George Dyson', '1400075998', 2012, 'English'),
    ('60a9b724-1193-45f6-adab-bb2c6c20bff2', 'Thinking in Systems', 'Donella H. Meadows', '1603580557', 2008, 'English'),
    ('cb8976d7-e88b-4537-ab65-cb560794b5a4', 'Gödel, Escher, Bach: An Eternal Golden Braid', 'Douglas R Hofstadter', '0465026567', 1979, 'English'),
    ('d5d58198-92cc-4960-9aee-1dc41f306bee', 'The Lean Startup: How Today''s Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses', 'Eric Ries', '1524762407', 2011, 'English'),
    ('1263179c-4695-4d4f-a569-b4c8342487e0', 'The Seven Storey Mountain', 'Thomas Merton', '0156010860', 1948, 'English'),
    ('0939422d-f4b6-4ed3-b86b-cae567f92c66', 'Rework: Change The Way You Work Forever', 'Jason Fried and David Heinemeier Hansson', '1400075998', 2010, 'English'),
    ('31295524-1798-443c-a7f1-bca4d439d5ae', 'The Waves', 'Virginia Woolf', '1789431492', 1931, 'English'),
    ('e37cbd77-e126-45da-919c-3f24f4ac7a9b', 'Collected Fictions', 'Jorge Luis Borges', '0140286802', 1999, 'English'),
    ('e87762fb-794e-47fc-a8b2-125ec76fccfb', 'Becoming', 'Michelle Obama', '1524763136', 2018, 'English'),
    ('c245b802-09cb-4dd9-bfe0-51f7cb4fefaa', 'My Antonia', 'Willa Cather', '0008352569', 1918, 'English'),
    ('9ecd518e-a258-49fa-bafe-27aa41a97c86', 'The Golden Apples', 'Eudora Welty', '015636090X', 1949, 'English'),
    ('73e8bda7-6485-4ae6-9b3f-30cacf5a618a', 'Friend of My Youth: Stories', 'Alice Munro', '0394584422', 1990, 'English'),
    ('109eab45-d953-4419-8d6f-912f7e6005d0', 'Essays and Poems', 'Ralph Waldo Emerson', '159308076X', 2012, 'English'),
    ('af01657a-f392-4403-874f-e4b486ba12e7', 'I Know Why the Caged Bird Sings', 'Maya Angelou', '9780812980028', 1969, 'English'),
    ('5fc40107-2535-4b8b-a0e7-710ff8e69c12', 'One Man''s Wilderness, 50th Anniversary Edition: An Alaskan Odyssey', 'Sam Keith and Richard Louis Proenneke', '1513261649', 1973, 'English'),
    ('20397a30-34cc-4ed9-ac11-f77b9832f2cc', 'Brothers Karamazov', 'Fyodor Dostoevsky', '0374528373', 1880, 'English'),
    ('2af5124b-63cc-4136-a9cb-0c89a9a16efe', 'Crime and Punishment', 'Fyodor Dostoevsky', '0679734503', 1866, 'English'),
    ('b8af33e2-ac90-42d6-b58d-17675c4586db', 'Song of Solomon', 'Toni Morrison', '140003342X', 1977, 'English'),
    ('92da018f-48be-4d07-88db-0909ebba89ee', 'War and Peace', 'Leo Tolstoy', '1603580557', 1869, 'English'),
    ('cb6a753f-a5f4-40e6-960e-4ba83edea28d', 'Mrs. Dalloway', 'Virginia Woolf', '1950330745', 1925, 'English'),
    ('bab43282-511f-4dda-9172-baed5ddb8d0a', 'Their Eyes Were Watching God', 'Zora Neale Hurston', '9780061120060', 1937, 'English');


INSERT INTO audio_books
    ("AssetId", "Title", "Author", "ASIN", "PublicationYear", "LengthMinutes", "Publisher")
VALUES
    ('b5445eba-482e-4161-a039-1fcfc2a1983f', 'Classics of Russian Literature', 'The Great Courses, Irwin Weil', 'B00DTNWHWO', 2006, 1049, 'The Teaching Company'),
    ('60d948e5-a39c-4473-87aa-f2d172af4518', 'Maya to Aztec: Ancient Mesoamerica Revealed', 'The Great Courses, Edwin Barnhart', 'B00UBLM7D6', 2015, 1395, 'The Teaching Company');


-- Generate Initial Library Cards
INSERT INTO library_cards
    ("CurrentFees", "Issued")
VALUES
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW()),
    (0, NOW());

INSERT INTO dvds
    ("AssetId", "Title", "Year", "Director", "LengthMinutes", "Language")
VALUES
    ('4895ecbf-bbe3-4a8f-99d4-0431c5bfb7d0', 'Citizen Kane', 1941, 'Orson Welles', 150, 'English'),
    ('8fbfb418-9ea0-44bb-9775-44049bb24072', 'The Commitments', 1991, 'Alan Parker', 117, 'English'),
    ('688fccac-f707-41ba-abab-0f76c75abcff', 'Rashomon', 1951, 'Akira Kurosawa', 88, 'Japanese');

INSERT INTO audio_cds
    ("AssetId", "Title", "Artist", "PublicationYear", "Label", "Genre")
VALUES
    ('bab43282-511f-4dda-9172-baed5ddb8d0a', 'Essential Mozart', 'Various Artists', 2001, 'Decca', 'Concertos');