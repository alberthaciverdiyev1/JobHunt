﻿using Microsoft.EntityFrameworkCore;
using Job.DAL;

namespace Job.Services
{
    public class LayoutService
    {
        private readonly AppDbContext _context;

        public LayoutService(AppDbContext context)
        {
            _context = context;
        }
        public async Task<Dictionary<string, string>> Getsetting()
        {

            Dictionary<string, string> setting = await _context.Settings.ToDictionaryAsync(x => x.Key, x => x.Value);
            return setting;
        }
    }
}
