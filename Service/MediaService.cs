/* Zachary Yates
 * Copyright © 2008 YatesMorrison Software, LLC.
 * 4/5/2008 1:05:08 PM
 */

using System;
using System.Configuration;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;

using YatesMorrison.SiteSmith.Data;

namespace YatesMorrison.SiteSmith.Service
{
	/// <summary>
	/// Provides business logic for uploading and managing images and videos
	/// </summary>
	public class MediaService
	{
		public Media Upload(byte[] data, string fileName)
		{
			// Write the file
			Guid mediaId = Guid.NewGuid();
			string path = ConfigurationManager.AppSettings["MediaPath"];
			path = path + @"\Originals\" + mediaId + Path.GetExtension(fileName);
			
			EnsureFolder(Path.GetDirectoryName(path));
			FileStream fsData = new FileStream(path, FileMode.Create);
			fsData.Write(data, 0, data.Length);

			// Save the record

			using (SiteSmithDataContext context = new SiteSmithDataContext())
			{
				Media media = new Media
				{
					MediaId = mediaId,
					Size = data.Length,
					Name = Path.GetFileNameWithoutExtension(fileName),
					Path = path,
					FileExtension = Path.GetExtension(path).Replace(".", ""),
					Created = DateTime.UtcNow,
					Modified = DateTime.UtcNow
					// TODO: Add height width calculation?
				};

				context.Medias.InsertOnSubmit(media);
				context.SubmitChanges();

				return media;
			}
		}

		void EnsureFolder(string path)
		{
			if (!Directory.Exists(Path.GetDirectoryName(path)))
			{
				Directory.CreateDirectory(Path.GetDirectoryName(path));
			}
		}

		public void Resize(string originalPath, string targetPath, int targetWidth, int targetHeight)
		{
			// Read the file and open the image objects
			using (FileStream originalStream = new FileStream(originalPath, FileMode.Open))
			using (Image originalImage = Image.FromStream(originalStream))
			using (Image targetImage = Image.FromStream(originalStream))
			{
				// Determine the size
				Size targetSize = GetSizeKeepAspect(originalImage.Width, originalImage.Height, targetWidth, targetHeight);
				// Create the canvas to draw the resized image on
				using (Bitmap targetBitmap = new Bitmap(targetSize.Width, targetSize.Height, PixelFormat.Format24bppRgb))
				{
					targetBitmap.SetResolution(72, 72);
					using (Graphics targetGraphics = Graphics.FromImage(targetBitmap))
					{
						// Set the graphics options
						targetGraphics.SmoothingMode = SmoothingMode.AntiAlias;
						targetGraphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
						targetGraphics.PixelOffsetMode = PixelOffsetMode.HighQuality;
						targetGraphics.DrawImage(targetImage,
							new Rectangle(new Point(0, 0), targetSize), 0, 0, originalImage.Width, originalImage.Height, GraphicsUnit.Pixel);
						// Save the image to the targetPath
						EnsureFolder(targetPath);
						using (FileStream targetStream = new FileStream(targetPath, FileMode.Create))
						{
							targetBitmap.Save(targetStream, GetFormatFromExtension(Path.GetExtension(targetPath)));
						}
					}
				}
			}
		}

		static ImageFormat GetFormatFromExtension(string extension)
		{
			switch (extension.ToLowerInvariant())
			{
				case ".bmp": return ImageFormat.Bmp;
				case ".jpg":
				case ".jpeg": return ImageFormat.Jpeg;
				case ".png": return ImageFormat.Png;
				case ".gif": return ImageFormat.Gif;
				default: throw new InvalidOperationException(extension + " is not a supported format");
			}
		}

		static Size GetSizeKeepAspect(int originalWidth, int originalHeight, int targetWidth, int targetHeight)
		{
			float multiplier;
			if (originalHeight > originalWidth)
			{
				multiplier = (float)targetHeight / (float)originalHeight;
			}
			else
			{
				multiplier = (float)targetWidth / (float)originalWidth;
			}
			return new Size((int)(multiplier * originalWidth), (int)(multiplier * originalHeight));
		}
	}
}