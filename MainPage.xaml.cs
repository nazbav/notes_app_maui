using Android.Graphics.Fonts;
using Newtonsoft.Json;
using System.Net.Http;
using System.Net.Http.Json;
using System.Text;
using Microsoft.Maui.Graphics;
using System.Text.Json.Serialization;
using System.Text.Json;
namespace notes_app_maui
{

    public class ResponseObject
    {
        public string Status { get; set; }
        public List<Note> Result { get; set; }
        public string Action { get; set; }
    }


    public class Note
    {
        public string Action { get; set; }
        public string Id { get; set; }
        public string Text { get; set; }
        public string CreatedAt { get; set; }
        public string Checked { get; set; }
    }

    public partial class MainPage : ContentPage
    {
        private Uri apiUrl;

        private JsonSerializerOptions? options = new JsonSerializerOptions()
        {
            AllowTrailingCommas = true,
            DefaultIgnoreCondition = JsonIgnoreCondition.WhenWritingNull,
            IgnoreReadOnlyProperties = true,
            NumberHandling = JsonNumberHandling.WriteAsString,
            PropertyNamingPolicy = JsonNamingPolicy.CamelCase,
            WriteIndented = true
        };

        static readonly HttpClient client = new HttpClient();
        public MainPage()
        {
            InitializeComponent();



            apiUrl = new Uri(string.Format(url.Text, string.Empty));
            client.DefaultRequestHeaders.UserAgent.ParseAdd("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537");

            getAllNotes();
        }


        private async Task getAllNotes()
        {
            HttpResponseMessage response = await client.GetAsync(apiUrl);
            response.EnsureSuccessStatusCode();
            var body = await response.Content.ReadAsStringAsync();
            Console.WriteLine(body.ToString());
            var responseObject = JsonConvert.DeserializeObject<ResponseObject>(body);

            System.Collections.Generic.List<Note> notes = responseObject.Result;

            await GetNotes(notes);
        }

        private async Task GetNotes(System.Collections.Generic.List<Note>? notes)
        {
            try
            {
                StackLayoutBlock.Children.Clear();

                foreach (var note in notes)
                {
                    var entry = new Editor { Text = $"{note.Text}", AutoSize = Microsoft.Maui.Controls.EditorAutoSizeOption.TextChanges };
                    Console.WriteLine(note.CreatedAt);
                    var checkBox = new CheckBox { IsChecked = Convert.ToInt16(note.Checked) == 1 ? true : false };
                    checkBox.GestureRecognizers.Add(new TapGestureRecognizer
                    {
                        Command = new Command(async () => await CheckNote(int.Parse(note.Id)))
                    });

                    var noteFrame = new Frame
                    {
                        Content = new SwipeView
                        {
                            RightItems = new SwipeItems
                    {
                        new SwipeItem
                        {
                            BackgroundColor = Colors.White,
                            Text = "Вып.",
                            Command = new Command(async () => await CheckNote(int.Parse(note.Id)))
                        },
                        new SwipeItem
                        {
                            BackgroundColor = Colors.White,
                            Text = "Ред.",
                            Command = new Command(async () => await EditNote(int.Parse(note.Id), entry.Text))
                        },

                        new SwipeItem
                        {
                            BackgroundColor = Colors.White,
                            Text = "Уд.",
                            Command = new Command(async () => await DeleteNote(int.Parse(note.Id)))
                        }
                    },
                            Content = new VerticalStackLayout
                            {
                                Children =
                    {
                        new HorizontalStackLayout {
                        checkBox,
                        entry,
                            }
                    }
                            }
                        },
                        BackgroundColor = Colors.White,
                        BorderColor = Colors.Black,
                        Margin = new Thickness(10)
                    };

                    StackLayoutBlock.Children.Add(noteFrame);
                }
            }
            catch (Exception ex)
            {
                var noteFrame = new Frame
                {
                    Content = new Label { Text = $"Error: {ex.Message} {ex.InnerException} {ex.Source} {ex.StackTrace.ToString()}" },
                    BorderColor = Colors.Black,
                    Margin = new Thickness(10)
                };

                StackLayoutBlock.Children.Add(noteFrame);
            }
        }


        private async Task AddNote(string noteText)
        {
            Note note = new Note { Action = "add", Text = noteText };

            HttpResponseMessage response = await client.PostAsJsonAsync(apiUrl, note, options);
            response.EnsureSuccessStatusCode();
            var body = await response.Content.ReadAsStringAsync();
            Console.WriteLine(body.ToString());
            var responseObject = JsonConvert.DeserializeObject<ResponseObject>(body);
            System.Collections.Generic.List<Note> notes = responseObject.Result;

            await GetNotes(notes);
        }

        private async Task EditNote(int id, string newText)
        {
            Note note = new Note { Action = "edit", Text = newText, Id = Convert.ToString(id) };

            HttpResponseMessage response = await client.PostAsJsonAsync(apiUrl, note, options);
            response.EnsureSuccessStatusCode();
            var body = await response.Content.ReadAsStringAsync();
            Console.WriteLine(body.ToString());
            var responseObject = JsonConvert.DeserializeObject<ResponseObject>(body);
            System.Collections.Generic.List<Note> notes = responseObject.Result;



            await GetNotes(notes);

        }

        private async Task DeleteNote(int id)
        {
            Note note = new Note { Action = "delete", Id = Convert.ToString(id) };

            HttpResponseMessage response = await client.PostAsJsonAsync(apiUrl, note);
            response.EnsureSuccessStatusCode();
            var body = await response.Content.ReadAsStringAsync();
            Console.WriteLine(body.ToString());
            var responseObject = JsonConvert.DeserializeObject<ResponseObject>(body);
            var notes = responseObject.Result;

            await GetNotes(notes);

        }

        private async Task CheckNote(int id)
        {
            Note note = new Note { Action = "check", Id = Convert.ToString(id) };

            HttpResponseMessage response = await client.PostAsJsonAsync(apiUrl, note);
            response.EnsureSuccessStatusCode();
            var body = await response.Content.ReadAsStringAsync();
            Console.WriteLine(body.ToString());
            var responseObject = JsonConvert.DeserializeObject<ResponseObject>(body);
            var notes = responseObject.Result;

            await GetNotes(notes);
        }

        public async void OnAddNoteButtonClicked(object sender, EventArgs e)
        {
            string newNoteText = this.newNoteText.Text;

            await AddNote(newNoteText);

            newNoteText = "";
        }
        public async void getNotesButton(object sender, EventArgs e)
        {
            await getAllNotes();
        }
    }









}
