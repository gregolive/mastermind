# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength

# Stylize text
module TextFormat
  def formatting(description, string)
    {
      'bold' => "\e[1m#{string}\e[22m",
      'underline' => "\e[4;1m#{string}\e[0m",
      'italic' => "\e[3m#{string}\e[23m",

      'black' => "\e[30m#{string}\e[0m",
      'red' => "\e[31m#{string}\e[0m",
      'green' => "\e[32m#{string}\e[0m",
      'yellow' => "\e[33m#{string}\e[0m",
      'blue' => "\e[34m#{string}\e[0m",
      'magenta' => "\e[35m#{string}\e[0m",
      'cyan' => "\e[36m#{string}\e[0m",
      'gray' => "\e[37m#{string}\e[0m",

      'bg_black' => "\e[40m#{string}\e[0m",
      'bg_red' => "\e[41m#{string}\e[0m",
      'bg_green' => "\e[42m#{string}\e[0m",
      'bg_yellow' => "\e[43m#{string}\e[0m",
      'bg_blue' => "\e[44m#{string}\e[0m",
      'bg_magenta' => "\e[45m#{string}\e[0m",
      'bg_cyan' => "\e[46m#{string}\e[0m",
      # use instead of gray_bg so text is visible
      'reverse_color' => "\e[7m#{string}\e[0m"
    }[description]
  end
end

# rubocop:enable Metrics/MethodLength
