import SwiftUI
import AppKit

@main
struct MenuBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings {
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var popover: NSPopover?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        NSApp.setActivationPolicy(.accessory)
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "link.circle.fill", accessibilityDescription: "Menu Bar App")
            button.action = #selector(togglePopover(_:))
            button.target = self
        }
        
        popover = NSPopover()
        popover?.contentViewController = NSHostingController(rootView: ContentView())
        popover?.behavior = .transient
    }
    
    @objc func togglePopover(_ sender: Any?) {
        guard let popover = popover else { return }
        
        if popover.isShown {
            popover.performClose(sender)
        } else {
            if let statusButton = statusItem?.button {
                popover.show(relativeTo: statusButton.bounds, of: statusButton, preferredEdge: .minY)
                NSApp.activate(ignoringOtherApps: true)
            }
        }
    }
}

struct Website: Identifiable, Codable {
    var id = UUID()
    var name: String
    var url: String
}

struct ContentView: View {
    @State private var websites: [Website] = []
    @State private var newName: String = ""
    @State private var newURL: String = ""
    @State private var showAddForm: Bool = false
    
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Quick Links")
                    .font(.headline)
                Spacer()
                Button(action: { showAddForm.toggle() }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 16))
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 12)
            .padding(.top, 12)
            
            if showAddForm {
                VStack(spacing: 8) {
                    TextField("Site name", text: $newName)
                        .textFieldStyle(.roundedBorder)
                    
                    TextField("URL (e.g., https://example.com)", text: $newURL)
                        .textFieldStyle(.roundedBorder)
                    
                    HStack(spacing: 8) {
                        Button("Add") {
                            addWebsite()
                        }
                        .keyboardShortcut(.defaultAction)
                        
                        Button("Cancel") {
                            showAddForm = false
                            newName = ""
                            newURL = ""
                        }
                        .keyboardShortcut(.cancelAction)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(10)
                .background(Color(.controlBackgroundColor))
                .cornerRadius(6)
                .padding(.horizontal, 12)
            }
            
            if websites.isEmpty {
                VStack(spacing: 8) {
                    Image(systemName: "link")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                    Text("No links yet")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
            } else {
                ScrollView {
                    VStack(spacing: 6) {
                        ForEach(websites) { website in
                            WebsiteRow(website: website, onOpen: { openWebsite(website) }, onDelete: { deleteWebsite(website) })
                        }
                    }
                    .padding(.horizontal, 12)
                }
            }
            
            Divider()
            
            HStack(spacing: 8) {
                Button(action: { NSApp.terminate(nil) }) {
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 14))
                    Text("Quit")
                        .font(.caption)
                }
                .buttonStyle(.plain)
                .foregroundColor(.red)
                
                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 12)
        }
        .frame(width: 300)
        .onAppear {
            loadWebsites()
        }
    }
    
    private func addWebsite() {
        guard !newName.trimmingCharacters(in: .whitespaces).isEmpty,
              !newURL.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        let website = Website(name: newName, url: newURL)
        websites.append(website)
        newName = ""
        newURL = ""
        showAddForm = false
        saveWebsites()
    }
    
    private func deleteWebsite(_ website: Website) {
        websites.removeAll { $0.id == website.id }
        saveWebsites()
    }
    
    private func openWebsite(_ website: Website) {
        var urlString = website.url
        if !urlString.starts(with: "http://") && !urlString.starts(with: "https://") {
            urlString = "https://" + urlString
        }
        
        if let url = URL(string: urlString) {
            NSWorkspace.shared.open(url)
        }
    }
    
    private func saveWebsites() {
        if let encoded = try? JSONEncoder().encode(websites) {
            UserDefaults.standard.set(encoded, forKey: "websites")
        }
    }
    
    private func loadWebsites() {
        if let saved = UserDefaults.standard.data(forKey: "websites"),
           let decoded = try? JSONDecoder().decode([Website].self, from: saved) {
            websites = decoded
        }
    }
}

struct WebsiteRow: View {
    let website: Website
    let onOpen: () -> Void
    let onDelete: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "link.circle")
                .foregroundColor(.blue)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(website.name)
                    .font(.system(.body, design: .default))
                    .lineLimit(1)
                Text(website.url)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            HStack(spacing: 6) {
                Button(action: onOpen) {
                    Image(systemName: "arrow.up.right")
                        .font(.system(size: 12))
                }
                .buttonStyle(.plain)
                .foregroundColor(.blue)
                
                Button(action: onDelete) {
                    Image(systemName: "trash")
                        .font(.system(size: 12))
                }
                .buttonStyle(.plain)
                .foregroundColor(.red)
            }
        }
        .padding(8)
        .background(Color(.controlBackgroundColor))
        .cornerRadius(6)
    }
}

#Preview {
    ContentView()
}
