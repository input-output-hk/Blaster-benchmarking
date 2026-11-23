import LiveScripts.Shared
import LiveScripts.S_dfe5b0ea413a7e03c4c0ff5a243b29b1f8128a52c965e24c374f8c56.Script
import Blaster.Command.Syntax

open PlutusCore.Data (Data)

-- A falsification yields a candidate invocation. The precondition is
-- structural only; ledger context validation and replay are required.
#blaster (timeout: 20) (solve-result: 1)
  [∀ ctx : Data,
    LiveScripts.candidateContext ctx →
      ¬ LiveScripts.succeeds script_dfe5b0ea413a7e03c4c0ff5a243b29b1f8128a52c965e24c374f8c56.script [ctx] 10000]
