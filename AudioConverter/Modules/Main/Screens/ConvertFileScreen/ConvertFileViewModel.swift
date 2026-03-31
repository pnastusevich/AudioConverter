import Combine

enum FormatForConvert: CaseIterable {
    case mp3
    case m4a
    case wav
    case aac
    case flac
    case oga
    case ogg
    case wma
    case aiff
    
    var title: String {
        switch self {
        case .mp3:
            "MP3"
        case .m4a:
            "M4A"
        case .wav:
            "MAV"
        case .aac:
            "AAC"
        case .flac:
            "FLAC"
        case .oga:
            "OGA"
        case .ogg:
            "OGG"
        case .wma:
            "WMA"
        case .aiff:
            "AIFF"
        }
    }
    
    var imageName: String {
        switch self {
        case .mp3:
            "iconFiles1"
        case .m4a:
            "iconFiles2"
        case .wav:
            "iconFiles3"
        case .aac:
            "iconFiles4"
        case .flac:
            "iconFiles5"
        case .oga:
            "iconFiles6"
        case .ogg:
            "iconFiles7"
        case .wma:
            "iconFiles8"
        case .aiff:
            "iconFiles9"
        }
    }
}

final class ConvertFileViewModel: ObservableObject {
    
    @Published var file: ModelFiles
    @Published var selectedFormat: FormatForConvert?
   
    var formats: [FormatForConvert] = FormatForConvert.allCases
    
    var isConvertEnabled: Bool {
        return selectedFormat != nil
    }
    
    init(file: ModelFiles) {
        self.file = file
    }
    
    func tapFormat(_ format: FormatForConvert) {
        if format == selectedFormat {
            selectedFormat = nil
        } else {
            selectedFormat = format
        }
    }
    
    func convertFile() {
        
    }
}

